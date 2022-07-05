import 'package:flutter/material.dart';

class TriangleBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(-size.height*0.72, size.height);
    path.lineTo(size.width, size.height* 0.40);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleBackground oldClipper) => false;
}
