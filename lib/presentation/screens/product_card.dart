import 'package:flutter/material.dart';
import 'package:grupo_exito/models/product.dart';
import 'package:grupo_exito/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final quantity = cartProvider.getProductQuantity(product);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen centrada
            Center(
              child: Image.network(
                product.image,
                height: 12.h,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 1.h),

            // Nombre del producto
            Text(
              product.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Padding(
                padding: EdgeInsets.only(top: 0.5.h),
                child: Text(
                  product.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            // Precio en rojo
            Padding(
              padding: EdgeInsets.only(top: 0.8.h),
              child: Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(child: SizedBox(height: 1.h)),
            // Botón de agregar o modificar cantidad
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: quantity == 0
                  ? SizedBox(
                      key: const ValueKey('agregar'),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 1.2.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () => cartProvider.addProduct(product),
                        child: Text('Agregar', style: TextStyle(fontSize: 14.sp)),
                      ),
                    )
                  : Row(
                      key: const ValueKey('contador'),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                          onPressed: () => cartProvider.removeProduct(product),
                        ),
                        Text(
                          '$quantity\n${quantity > 1 ? 'Unidades' : 'Unidad'}',
                          style: TextStyle(fontSize: 14.sp),
                          textAlign: TextAlign.center,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                          onPressed: () => cartProvider.addProduct(product),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}