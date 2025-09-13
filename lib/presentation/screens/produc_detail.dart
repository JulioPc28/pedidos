// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grupo_exito/models/product.dart';
import 'package:grupo_exito/presentation/widget/text_input_pedidos.dart';
import 'package:grupo_exito/providers/cart_provider.dart';
import 'package:grupo_exito/services/api_services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProducDetail extends StatelessWidget {
  const ProducDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cart = cartProvider.currentCart;
    final apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: TextInputPedidos(
          title: 'Resumen del carrito',
          colorText: Colors.black,
          dimen: 16.sp,
          onPressed: () {},
          sombra: true,
          subrayado: false,
        ),
        backgroundColor: cartProvider.cartColor,
        toolbarHeight: kIsWeb ? 18.h : 10.h,
      ),
      body: cart.isEmpty
          ? const Center(child: Text('Tu carrito está vacío'))
          : FutureBuilder<List<Product>>(
              future: apiService.fetchAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final allProducts = snapshot.data!;
                final selectedProducts = allProducts
                    .where((product) => cart.containsKey(product.id))
                    .toList();

                double total = selectedProducts.fold(0, (sum, product) {
                  final quantity = cart[product.id]!;
                  return sum + (product.price * quantity);
                });

                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                        itemCount: selectedProducts.length,
                        itemBuilder: (context, index) {
                          final product = selectedProducts[index];
                          final quantity = cart[product.id]!;

                          return Card(
                            elevation: 3,
                            margin: EdgeInsets.symmetric(vertical: 1.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      product.image,
                                      width: 14.w,
                                      height: kIsWeb ? 12.h : 7.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.title,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 0.5.h),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                                              onPressed: () {
                                                cartProvider.removeProduct(product);
                                              },
                                            ),
                                            Text(
                                              '$quantity',
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.add_circle_outline, color: Colors.green),
                                              onPressed: () {
                                                cartProvider.addProduct(product);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '\$${(product.price * quantity).toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: cartProvider.cartColor.withOpacity(0.1),
                        border: Border(
                          top: BorderSide(color: cartProvider.cartColor, width: 1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextInputPedidos(
                            title: 'Total de la compra:',
                            colorText: Colors.black,
                            dimen: 16.sp,
                            onPressed: () {},
                            sombra: true,
                            subrayado: false,
                          ),
                          TextInputPedidos(
                            title: '\$${total.toStringAsFixed(2)}',
                            colorText: Colors.red,
                            dimen: 16.sp,
                            onPressed: () {},
                            sombra: true,
                            subrayado: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}