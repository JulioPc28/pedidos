import 'package:flutter/material.dart';
import 'package:grupo_exito/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartProvider extends ChangeNotifier {
  // Carrito tradicional
  final Map<int, int> _normalCart = {};

  // Carrito express
  final Map<int, int> _expressCart = {};

  // Estado del modo express (activado/desactivado)
  bool _isExpressActive = false;

  /// Getter del estado actual del modo express
  bool get isExpressActive => _isExpressActive;

  /// Retorna el carrito activo según el modo seleccionado
  Map<int, int> get currentCart =>
      _isExpressActive ? _expressCart : _normalCart;



  /// Cambia el modo express y guarda la preferencia del usuario
  Future<void> toggleExpress(bool value) async {
    _isExpressActive = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isExpressActive', value);
    notifyListeners();
  }

 bool isReady = false;

  /// Carga el estado guardado del modo express al iniciar la app
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isExpressActive = prefs.getBool('isExpressActive') ?? false;
     isReady = true;
    notifyListeners();
  }


  /// Agrega una unidad del producto al carrito actual
  void addProduct(Product product) {
    final cart = currentCart;
    cart[product.id] = (cart[product.id] ?? 0) + 1;
    notifyListeners();
  }

  /// Elimina una unidad del producto del carrito actual
  void removeProduct(Product product) {
    final cart = currentCart;
    if (cart.containsKey(product.id)) {
      cart[product.id] = cart[product.id]! - 1;
      if (cart[product.id]! <= 0) {
        cart.remove(product.id);
      }
      notifyListeners();
    }
  }

  /// Obtiene la cantidad actual de unidades de un producto en el carrito
  int getProductQuantity(Product product) {
    final cart = currentCart;
    return cart[product.id] ?? 0;
  }

  /// Devuelve el color del carrito según el modo activo
  Color get cartColor => _isExpressActive ? Colors.orange : Color(0XFFffe506);


  
}