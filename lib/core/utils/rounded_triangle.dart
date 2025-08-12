import 'package:flutter/material.dart';

class RoundedTriangle extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;

  const RoundedTriangle({
    super.key,
    required this.width,
    required this.height,
    this.radius = 4.0,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _RoundedTrianglePainter(
        color: color,
        radius: radius,
      ),
    );
  }
}

class _RoundedTrianglePainter extends CustomPainter {
  final Color color;
  final double radius;

  _RoundedTrianglePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.arcToPoint(
      Offset(size.width - radius, size.height - radius),
      radius: Radius.circular(radius),
    );
    path.lineTo(size.width / 2 + radius, size.height - radius);
    path.arcToPoint(
      Offset(size.width / 2 - radius, size.height - radius),
      radius: Radius.circular(radius),
    );
    path.lineTo(radius, size.height - radius);
    path.arcToPoint(
      Offset(0, 0),
      radius: Radius.circular(radius),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}