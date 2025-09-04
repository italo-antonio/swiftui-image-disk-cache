//
//  ImageDiskCache.swift
//  StoreImageDiskCache
//
//  Created by Italo Barzola García on 4/9/25.
//

import Foundation
import SwiftUI
import CryptoKit

final class ImageMemoryCache {
    static let shared = NSCache<NSURL, UIImage>()
    static func configure() {
        shared.countLimit = 400
        shared.totalCostLimit = 100 * 1024 * 1024
    }
}

final class ImageDiskCache {
    static let shared = ImageDiskCache()
    private let directory: URL
    
    
    private init() {
        let base = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let dir = base.appendingPathComponent("ImageDiskCache", isDirectory: true)
        if !FileManager.default.fileExists(atPath: dir.path) {
            try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        }
        self.directory = dir
    }
    
    
    private func filename(for url: URL) -> String {
        let digest = SHA256.hash(data: Data(url.absoluteString.utf8))
        let hex = digest.compactMap { String(format: "%02x", $0) }.joined()
        return hex + ".jpg"
    }
    
    
    func image(for url: URL) -> UIImage? {
        let path = directory.appendingPathComponent(filename(for: url))
        guard let data = try? Data(contentsOf: path) else { return nil }
        return UIImage(data: data)
    }
    
    
    func store(_ image: UIImage, for url: URL) {
        let path = directory.appendingPathComponent(filename(for: url))
        guard let data = image.jpegData(compressionQuality: 0.9) else { return }
        try? data.write(to: path, options: [.atomic])
    }
}

@MainActor
final class ImageLoader: ObservableObject {
    enum Source { case memory, disk, network }
    enum State: Equatable { case idle, loading, loaded(Source), failed(String) }
    
    
    @Published var image: UIImage? = nil
    @Published var state: State = .idle
    
    
    private var currentURL: URL?
    
    
    func load(_ url: URL) {
        currentURL = url
        
        if let img = ImageMemoryCache.shared.object(forKey: url as NSURL) {
            self.image = img; self.state = .loaded(.memory); return
        }
        
        
        self.state = .loading
        Task {
            if let img = ImageDiskCache.shared.image(for: url) {
                ImageMemoryCache.shared.setObject(img, forKey: url as NSURL, cost: img.diskCost)
                self.image = img; self.state = .loaded(.disk); return
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let img = UIImage(data: data) else { throw URLError(.cannotDecodeContentData) }
                ImageMemoryCache.shared.setObject(img, forKey: url as NSURL, cost: data.count)
                ImageDiskCache.shared.store(img, for: url)
                self.image = img; self.state = .loaded(.network)
            } catch {
                self.state = .failed(error.localizedDescription)
            }
        }
    }
}


private extension UIImage {
    var diskCost: Int { pngData()?.count ?? 1 }
}
