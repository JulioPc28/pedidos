import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grupo_exito/presentation/widget/conffeti.dart';
import 'package:grupo_exito/presentation/widget/esquinas_style.dart';
import 'package:grupo_exito/presentation/widget/logo_onboarding.dart';
import 'package:grupo_exito/presentation/widget/onboarding_bloque_title.dart';
import 'package:sizer/sizer.dart';

Widget buildMobileLayout(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Stack(
        children: [
          EsquinasStyle(color: Color(0xFF000000), alto:  MediaQuery.of(context).size.height * 0.42),
          EsquinasStyle(color: Color(0xFFFFE082), alto:  MediaQuery.of(context).size.height * 0.4),
          EsquinasStyle(color: Color(0xFFFFC107), alto:  MediaQuery.of(context).size.height * 0.38),
          EsquinasStyle(color: Color(0xFFFFD700), alto:  MediaQuery.of(context).size.height * 0.36),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 3.h),
                FadeIn(
                  delay: const Duration(seconds: 2),
                  duration: const Duration(seconds: 3),
                  child: onboardingBloqueTitle(context),
                ),
                SizedBox(height: 3.h),
                FadeIn(
                  delay: const Duration(seconds: 3),
                  duration: const Duration(seconds: 3),
                  child: Column(
                    children: [
                      Conffeti(),
                      logoOnboardingWeb(context),
                      SizedBox(height: 3.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(bottom: 0, child: EsquinasStyleInversa(color: Color(0xFF000000), alto:  MediaQuery.of(context).size.height * 0.42)),
          Positioned(bottom: 0, child: EsquinasStyleInversa(color: Color(0xFFFFE082), alto:  MediaQuery.of(context).size.height * 0.4)),
          Positioned(bottom: 0, child: EsquinasStyleInversa(color: Color(0xFFFFC107), alto:  MediaQuery.of(context).size.height * 0.38)),
          Positioned(bottom: 0, child: EsquinasStyleInversa(color: Color(0xFFFFD700), alto:  MediaQuery.of(context).size.height * 0.36)),
          
          
         
        ],
      ),
    ),
  );
}