import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grupo_exito/models/product.dart';
import 'package:grupo_exito/presentation/screens/product_card.dart';
import 'package:sizer/sizer.dart';

class ProductListView extends StatelessWidget {
  final Future<List<Product>> future;
  final List<Product> filteredProducts;
  final bool isLoading;

  const ProductListView({
    super.key,
    required this.future,
    required this.filteredProducts,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: future,
      builder: (context, snapshot) {
        // Estado de carga
        if (snapshot.connectionState == ConnectionState.waiting && isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Error en la carga
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Lista vacía
        if (filteredProducts.isEmpty) {
          return const Center(child: Text('No hay productos que coincidan'));
        }

        // Vista de productos en grilla
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: kIsWeb ? 4 : 2, // ← columnas según dispositivo
            crossAxisSpacing: 1.w,
            mainAxisSpacing: 1.h,
            childAspectRatio: kIsWeb ? 0.95 : 0.6, // ← proporción de tarjeta
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return ProductCard(product: product);
          },
        );
      },
    );
  }
}