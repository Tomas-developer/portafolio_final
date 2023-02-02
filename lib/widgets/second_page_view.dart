import 'package:flutter/material.dart';

import '../commons/commons.dart';

class SecondPageView extends StatelessWidget {
  const SecondPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomPainter(),
      child: Container(
        child: Text("asdf")),
    );
  }
}

class _CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
     Path path = Path()
    
  ..moveTo(0, size.height)
    ..lineTo(0, size.height)
    ..lineTo(0, 60)
    ..lineTo(size.width * 0.2, 160)
    ..lineTo(size.width * 0.35, 110)
    ..lineTo(size.width * 0.40, 130)
    ..lineTo(size.width * 0.55, 90)
    ..lineTo(size.width * 0.70, 180)
    
    ..lineTo(size.width, 60)
    ..lineTo(size.width, size.height);
    
    Paint paint = Paint();
    
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
  

    paint.color = primaryColor;
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}