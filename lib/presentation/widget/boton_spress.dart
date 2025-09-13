import 'package:flutter/material.dart';
import 'package:grupo_exito/presentation/widget/text_input_pedidos.dart';
import 'package:grupo_exito/providers/cart_provider.dart';
import 'package:sizer/sizer.dart';

class ExpressToggleButton extends StatelessWidget {
  final CartProvider cartProvider;

  const ExpressToggleButton({super.key, required this.cartProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
      padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: cartProvider.cartColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: cartProvider.cartColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextInputPedidos(
                        title: 'Modo Express',
                        colorText: const Color(0xff000000),
                        dimen: 20.sp,
                        onPressed: () {},
                        sombra: true,
                        subrayado: false,
                      ),
                      SizedBox(height: 2.h),
                      SwitchListTile(
                        title: TextInputPedidos(
                        title: 'Activar experiencia express',
                        colorText: const Color(0xff000000),
                        dimen: 16.sp,
                        onPressed: () {},
                        sombra: false,
                        subrayado: false,
                      ),
                        value: cartProvider.isExpressActive,
                        onChanged: (value) {
                          cartProvider.toggleExpress(value);
                          Navigator.pop(context);
                        },
                        activeColor: const Color(0xFF000000),
                        inactiveThumbColor: Colors.grey,
                        contentPadding: EdgeInsets.zero,
                      ),
                      SizedBox(height: 2.h),
                      TextInputPedidos(
                        title:  cartProvider.isExpressActive
                            ? 'Express activado: entregas rápidas y navegación ágil.'
                            : 'Modo estándar: experiencia completa sin prisa.',
                        colorText: Color(0xff1b263b),
                        dimen: 14.sp,
                        onPressed: () {},
                        sombra: false,
                        subrayado: false,
                      ),
                     
                    ],
                  ),
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.flash_on, size: 22.sp, color: Colors.black),
              SizedBox(width: 1.w),
              TextInputPedidos(
                title: cartProvider.isExpressActive? 'Desactivar\nExpress' : 'Activar\nExpress',
                colorText: const Color(0xff000000),
                dimen: 14.sp,
                onPressed: () {},
                sombra: true,
                subrayado: false,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}