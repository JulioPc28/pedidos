// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';

class EsquinasStyle extends StatelessWidget {
  final Color color;
  final double alto;

  const EsquinasStyle({
    super.key,
    required this.color,
    required this.alto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: alto,
      width: double.infinity,
      // color: Colors.amber,
      child: CustomPaint(
        painter: _EsquinasStylePainter(color),
      ),
    );
  }
}

class _EsquinasStylePainter extends CustomPainter {
  final Color color;

  _EsquinasStylePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final path = Path();
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.25, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class EsquinasStyleInversa extends StatelessWidget {
  final Color color;
  final double alto;

  const EsquinasStyleInversa({
    super.key,
    required this.color,
    required this.alto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: alto,
      width: MediaQuery.of(context).size.width, // no se puede poner double.infinity porque trokea con el padre, y la positioned
      child: CustomPaint(
        painter: _EsquinasStyleInversaPainter(color),
      ),
    );
  }
}

class _EsquinasStyleInversaPainter extends CustomPainter {
  final Color color;

  _EsquinasStyleInversaPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final path = Path();
    path.moveTo(0, size.height); // Comienza desde abajo
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.65, size.width * 0.5, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.75, size.width, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}