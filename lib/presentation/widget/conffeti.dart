// ignore_for_file: deprecated_member_use
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class Conffeti extends StatefulWidget {
  const Conffeti({super.key});

  @override
  State<Conffeti> createState() => _ConffetiState();
}

class _ConffetiState extends State<Conffeti> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 5),
    );
    _confettiController.play(); // Dispara el confetti al iniciar
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Color(0xFFFFD700), // Amarillo dorado
                Color(0xFFFFF176), // Amarillo claro
                Color(0xFFFFE082), // Amarillo suave
                Color(0xFFFFC107), // Ámbar
                Color(0xFFFFF9C4), // Amarillo pastel
              ],
              numberOfParticles: kIsWeb ? 40 : 25,
              maxBlastForce: 15,
              minBlastForce: 5,
              emissionFrequency: 0.05,
              gravity: 0.1,
            ),
          ],
        ),
      ],
    );
  }
}