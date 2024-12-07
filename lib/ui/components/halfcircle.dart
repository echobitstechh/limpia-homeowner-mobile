import 'package:flutter/material.dart';

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height); // Start at the bottom-left
    path.arcToPoint(
      Offset(size.width, size.height),
      radius: Radius.circular(size.width),
      clockwise: true, // Creates the half-circle
    );
    path.lineTo(size.width, size.height); // Complete the shape
    path.lineTo(0, size.height); // Close the bottom edge
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
