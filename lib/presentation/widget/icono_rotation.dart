import 'package:flutter/material.dart';

class RotatingIcon extends StatefulWidget {
final  Color iconColor;
final  double iconSize;
final int rotationSpeed; 
   const RotatingIcon({
    required this.iconColor,
    required this.iconSize,
    required this.rotationSpeed, 
    super.key, 
  });

  @override
  State<RotatingIcon> createState() => _RotatingIconState();
}

class _RotatingIconState extends State<RotatingIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:  Duration(seconds: widget.rotationSpeed),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  
@override
Widget build(BuildContext context) {
  return Center(
    child: RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: Icon(
        Icons.settings,
        size: widget.iconSize,
        color: widget.iconColor,
      ),
    ),
  );
}
}