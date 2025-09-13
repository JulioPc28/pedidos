
import 'package:grupo_exito/models/product.dart';
import 'package:grupo_exito/services/class_abstract.dart';

class MockApiService implements IApiService {
  @override
  Future<List<String>> fetchCategories() async {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => ['electronics', 'jewelery', 'men clothing', 'women clothing'],
    );
  }

  @override
  Future<List<Product>> fetchProductsByCategory(String category) async {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => [
        Product(
          id: 1,
          title: 'Mock $category Product 1',
          price: 29.99,
          description: 'Descripción simulada del producto 1',
          category: category,
          image: 'https://picsum.photos/seed/${category}1/200', // Imagen aleatoria
          rating: 4.5,
          ratingCount: 12,
        ),
        Product(
          id: 2,
          title: 'Mock $category Product 2',
          price: 49.99,
          description: 'Descripción simulada del producto 2',
          category: category,
          image: 'https://picsum.photos/seed/${category}2/200',
          rating: 4.0,
          ratingCount: 8,
        ),
      ],
    );
  }

  @override
  Future<List<Product>> fetchAllProducts() async {
    // Simula productos de todas las categorías
    final categories = await fetchCategories();
    final all = <Product>[];
    for (final category in categories) {
      final products = await fetchProductsByCategory(category);
      all.addAll(products);
    }
    return all;
  }

  @override
  Future<String?> fetchFirstImageByCategory(String category) async {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => 'https://picsum.photos/seed/$category/200',
    );
  }
}