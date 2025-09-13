import 'package:flutter/material.dart';
import 'package:grupo_exito/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PedidoHeader extends StatelessWidget {
  final String typeview;

  const PedidoHeader({
    required this.typeview,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartColor = Provider.of<CartProvider>(context).cartColor;

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Este complemento está en desarrollo'),
            backgroundColor: Colors.black87,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          children: [
            Icon(Icons.location_on, color: cartColor, size: 20.sp),
            SizedBox(width: 2.w),
            Expanded(
              child: Text(
                typeview == 'home'
                    ? '¿Cómo quieres recibir tu pedido?  ✍️'
                    : 'Julio Potes, recibe en calle 25A # 15B 36 ✍️',
                style: TextStyle(
                  color: cartColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}