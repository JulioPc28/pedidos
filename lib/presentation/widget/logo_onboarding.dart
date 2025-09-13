import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grupo_exito/presentation/widget/icono_rotation.dart';
import 'package:grupo_exito/presentation/widget/text_input_pedidos.dart';
import 'package:grupo_exito/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';




Widget logoOnboardingWeb(BuildContext context) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap:  () {
         final cartProvider = Provider.of<CartProvider>(context, listen: false);
         if (!cartProvider.isReady) return;
         context.go('/home');
       },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatingIcon(iconColor: const Color(0xFFFFC107), iconSize: 25.sp, rotationSpeed: 4),
              Column(
                children: [
                  RotatingIcon(iconColor: const Color(0xFFFFD700), iconSize: 30.sp, rotationSpeed: 4),
                  RotatingIcon(iconColor: const Color(0xFFFFE082), iconSize: 25.sp, rotationSpeed: 4),
                ],
              ),
              SizedBox(
                height: kIsWeb ? 26.h : 16.h,
                child: Image.asset('assets/images/logo.jpg'),
              ),
              Column(
                children: [
                  RotatingIcon(iconColor: const Color(0xFFFFD700), iconSize: 30.sp, rotationSpeed: 4),
                  RotatingIcon(iconColor: const Color(0xFFFFE082), iconSize: 25.sp, rotationSpeed: 4),
                ],
              ),
              RotatingIcon(iconColor: const Color(0xFFFFC107), iconSize: 25.sp, rotationSpeed: 4),
            ],
          ),
          continuar(context),
        ],
      ),
    ),
  );
}

 TextInputPedidos continuar(BuildContext context) {
  return TextInputPedidos(
    title: kIsWeb ? "Click para continuar" : "Toque para continuar",
    colorText: const Color(0xff1b263b),
    dimen: 15.sp,
    onPressed: () => context.go('/home'),
    sombra: false,
    subrayado: false,
  );
}