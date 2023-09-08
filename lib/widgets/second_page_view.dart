// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:portafolio/widgets/custom_buttom.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

import '../commons/commons.dart';

class SecondPageView extends StatelessWidget {
  const SecondPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width < 600 ? size.width : size.width / 3;

    final items = [
      CustomButton(
        color: secondaryColor,
          pathImageIcon: "images/linkedin.png",
          text: "Linkedin",
          onTap: () {
            urlLauncher.launchUrl(Uri.https("www.linkedin.com", "in/tom%C3%A1s-saiz-olivares-47166a98", {"originalSubdomain" : "es"}));
          },
          width: width),
      const SizedBox(height: 20),
      CustomButton(
        color: secondaryColor,
          pathImageIcon: "images/logoinstagram.png",
          text: "Instagram",
          onTap: () {
            urlLauncher.launchUrl(Uri.https("instagram.com", "tom.s.o_93", {"igshid" : "YmMyMTA2M2Y="}));
          },
          width: width),
      const SizedBox(height: 20),
      CustomButton(
        color: secondaryColor,
          pathImageIcon: "images/facebook.png",
          text: "Facebook",
          onTap: () {
            urlLauncher.launchUrl(Uri.https("es-es.facebook.com","tomas.stile/"));
          },
          width: width)
    ];
    return CustomPaint(
        painter: _CustomPainter(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            width < 600 ? const SizedBox(height: 100,) : const SizedBox(),
            const Text(
              "Contacto",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20),
            size.width > 600
                ? Row(
                    children: items,
                  ):
              Column(
                    children: items,
                  ) 
          ],
        ));
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
