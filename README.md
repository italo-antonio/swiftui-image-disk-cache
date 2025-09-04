# 🛒 SwiftUI Image Disk Cache - Demo E-Commerce
Una demo práctica de un e-commerce en SwiftUI que muestra cómo implementar un sistema de caché de imágenes en memoria y disco usando NSCache + FileManager. Incluye lista de productos y carrito de compras con soporte para modo claro/oscuro y un tema de color personalizable.
---

## 🎥 Demo

<img width="1179" height="2556" alt="IMG_0409" src="https://github.com/user-attachments/assets/4151c2ea-2a31-4c73-9940-a3622c215dfa" />
---

## 🚀 ¿Cómo correr el proyecto?

1. Clona el repositorio:
   ```bash
   git clone git@github-developer:italo-antonio/swiftui-image-disk-cache.git
   ```

2. Abre el archivo `.xcodeproj` o `.xcodeworkspace` en Xcode:
   ```bash
   open StoreImageDiskCache.xcodeproj
   ```

3. Asegúrate de tener:
   - ✅ Xcode 15 o superior
   - ✅ iOS 17 mínimo (puedes ajustar el `Deployment Target` si lo necesitas)
   - ✅ Swift Charts framework disponible
   - ✅ Conexión a internet para consumir la API FakeStoreAPI

4. Ejecuta la app en el simulador o en un dispositivo físico:
   - `⌘R` para correr

---

## ✨ Características

- 🖼️ Caché de imágenes en RAM y Disco con recuperación automática
- 📦 Catálogo de productos desde FakeStoreAPI
- 🛍️ Carrito de compras con incremento, decremento y eliminación
- 🎨 Tema primario configurable (por defecto orange, fácilmente reemplazable)
- 🌙 Soporte modo claro/oscuro
- 🔄 Pull to refresh en lista de productos

---
## 🧠 Tecnologías usadas

- SwiftUI
- NSCache para memoria
- FileManager + SHA256 para persistencia en disco
- MVVM ligero con ObservableObject, @StateObject, @EnvironmentObject
- Async/Await para llamadas a red con URLSession

---

## 📬 Contacto

Hecho con ❤️ por Italo Barzola  
🔗 [LinkedIn](https://www.linkedin.com/in/italo-barzola/) 
