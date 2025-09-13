import 'package:grupo_exito/models/product.dart';

abstract class IApiService {
  Future<List<String>> fetchCategories();
  Future<List<Product>> fetchProductsByCategory(String category);
  Future<List<Product>> fetchAllProducts();
  Future<String?> fetchFirstImageByCategory(String category);
}