// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grupo_exito/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showAllProducts;
  final String typeview;
  final Function(String) onSearch;

  const CustomAppBar({
    super.key,
    required this.showAllProducts,
    required this.typeview,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartCount = cartProvider.currentCart.values.fold(0, (a, b) => a + b);

    return PreferredSize(
      preferredSize: Size.fromHeight(kIsWeb ? 18.h : 10.h),
      child: AppBar(
        backgroundColor: cartProvider.cartColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        /* leading: typeview == 'home' ? null :
        Center(
          child: IconButton(
            iconSize: 23.sp,
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ), */
        flexibleSpace: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 1.h,
            bottom: MediaQuery.of(context).padding.bottom + 1.h,
            // left: typeview == 'home' ? 0.0 : MediaQuery.of(context).padding.left + 1.w
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  typeview == 'home' ? SizedBox() :
                   IconButton(
                      iconSize: 23.sp,
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  SizedBox(width: 1.w,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF9C4),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.black, size: 22.sp),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: showAllProducts
                                    ? 'Buscar producto...'
                                    : 'Buscar categoría...',
                                hintStyle: const TextStyle(color: Colors.black),
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(color: Colors.black),
                              onChanged: onSearch,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  cartCount == 0
                      ? IconButton(
                          iconSize: 22.sp,
                          icon: const Icon(Icons.person_outline_rounded, color: Colors.black),
                          onPressed: () {},
                        )
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            IconButton(
                              iconSize: 22.sp,
                              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                              onPressed: () {
                                context.push('/carrito');
                              },
                            ),
                            Positioned(
                              right: 4.sp,
                              top: 1.sp,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '$cartCount',
                                    style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kIsWeb ? 18.h : 10.h);
}