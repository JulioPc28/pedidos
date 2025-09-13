
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:grupo_exito/presentation/widget/onboarding_movile.dart';
import 'package:grupo_exito/presentation/widget/onboarding_web.dart';  


class Onboarding extends StatefulWidget {
  static const String name = '/';
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  
  @override
  Widget build(BuildContext context) {
    // Detectar si es web
    if (kIsWeb) {
      return buildWebLayout(context);
    } 
    // Detectar si es Android 
    else if (Theme.of(context).platform == TargetPlatform.android) {
      return buildMobileLayout(context);
    } 
     else if (Theme.of(context).platform == TargetPlatform.iOS) {
      return buildMobileLayout(context);
    } 
    // Otras plataformas (iOS, Windows, etc.)
    else {
      return _buildOtherLayout(context);
    }
  }

  Widget _buildOtherLayout(BuildContext context) {
    // Aquí puedes definir un layout para otras plataformas, si lo deseas
    return const Scaffold(
      body: Center(
        child: Text('Plataforma no soportada'),
      ),
    );
  }
}
