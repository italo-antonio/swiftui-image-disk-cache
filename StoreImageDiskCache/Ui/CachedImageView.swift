//
//  CachedImageView.swift
//  StoreImageDiskCache
//
//  Created by Italo Barzola García on 4/9/25.
//

import SwiftUI



struct CachedImageView: View {
    @StateObject private var loader = ImageLoader()
    let url: URL
    var cornerRadius: CGFloat = 12
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Group {
                if let ui = loader.image {
                    Image(uiImage: ui)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .clipped()
                } else if case .failed = loader.state {
                    ZStack { Color.purple.opacity(0.08); Image(systemName: "exclamationmark.triangle") }
                } else {
                    ZStack { Color.purple.opacity(0.06); ProgressView() }
                }
            }
            .onAppear { loader.load(url) }
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            
        }
    }
}
