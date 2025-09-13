import 'package:flutter/material.dart';
import 'package:grupo_exito/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BotonesHome extends StatelessWidget {
  final bool showAllProducts;
  final bool isGridView;
  final VoidCallback onToggleView;
  final VoidCallback onToggleProducts;

  const BotonesHome({
    super.key,
    required this.showAllProducts,
    required this.isGridView,
    required this.onToggleView,
    required this.onToggleProducts,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      child: Row(
        children: [
          if (!showAllProducts)
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onToggleView,
                icon: Icon(Icons.grid_view, size: 18.sp),
                label: Text(
                  isGridView ? 'Lista vertical' : 'Grilla cuadrada',
                  style: TextStyle(fontSize: 12.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: cartProvider.cartColor,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 1.2.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
              ),
            ),

          if (!showAllProducts) SizedBox(width: 3.w),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: onToggleProducts,
              icon: Icon(Icons.view_list, size: 18.sp),
              label: Text(
                showAllProducts ? 'Ver categorías' : 'Ver todos',
                style: TextStyle(fontSize: 14.sp),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: cartProvider.cartColor,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 1.2.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}