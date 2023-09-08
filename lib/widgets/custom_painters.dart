import 'package:flutter/material.dart';

import '../commons/commons.dart';

class CustomPainter1 extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = colorText
      ..style = PaintingStyle.fill;


    Path path = Path()
    ..moveTo(0, 0)
    ..lineTo(size.width * 0.4, 0)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  }

  class CustomPainter2 extends CustomPainter {


  @override
void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.4, size.height);

    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  }