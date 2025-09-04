# 🛒 SwiftUI Image Disk Cache - Demo E-Commerce
---
Una demostración visual e interactiva de una pantalla bancaria que muestra cómo crecen tus intereses con animaciones progresivas, soporte para modo claro/oscuro y visualización de movimientos recientes. Ideal para apps tipo fintech o de ahorro.

## 🎥 Demo
<img width="1179" height="2556" alt="IMG_0421" src="https://github.com/user-attachments/assets/67edca07-14e2-45ed-bc76-0fd0df57370a" />
<img width="1179" height="2556" alt="IMG_0422" src="https://github.com/user-attachments/assets/37403a11-27b2-45a5-8b06-338030c2ef18" />

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
