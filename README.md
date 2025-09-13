# 🧪 Prueba Técnica – Desarrollo en Flutter

Este proyecto se construyó con **Flutter** y está pensada para funcionar tanto en **Android** como en **Web**, manteniendo una experiencia visual y funcional coherente en ambas plataformas.

---

## 🚀 Tecnologías utilizadas

- **Flutter**
- **Dart**
- **Provider** para gestión de estado
- **SharedPreferences** para persistencia local
- **GoRouter** para navegación declarativa
- **Sizer** para diseño responsivo

---

## 📦 Estructura del proyecto

lib/
├── models/               # Modelos de datos (Product, etc.)
├── providers/            # Lógica de estado (CartProvider, etc.)
├── services/             # Servicios simulados (ApiService)
├── presentation/
│   ├── views/            # Pantallas principales (Home, Cart, etc.)
│   └── widget/           # Componentes reutilizables (TextInputPedidos, etc.)
├── main.dart             # Punto de entrada de la app
├── routes/               # Configuración de rutas y navegación
assets/
├── images/               # Imágenes de productos o ilustraciones


---

## 🖼️ Funcionalidades principales

- Visualización de categorías en modo lista y cuadrícula
- Navegación entre categorías y productos
- Carrito con modo normal y express
- Persistencia del modo express entre sesiones
- Botones para agregar/quitar productos desde el carrito
- Cálculo automático del total de compra
- Diseño adaptable para Web y Android

---

## 📌 Notas técnicas

- El proyecto utiliza una clase `ApiService` que realiza **peticiones HTTP reales** a la API pública [FakeStoreAPI](https://fakestoreapi.com).
- Se consumen endpoints para obtener categorías, productos por categoría, todos los productos y la primera imagen de cada categoría.
- La lógica de negocio está desacoplada del origen de datos, lo que permite escalar o migrar a otra API sin modificar la interfaz.
- El estado del carrito se gestiona con `Provider`, y se incluye persistencia del modo express mediante `SharedPreferences`.
- El diseño es completamente responsivo gracias a `Sizer`, adaptándose a Web y Android sin perder proporción visual.

---

Gracias por la oportunidad 🙌

