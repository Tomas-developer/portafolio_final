import 'package:flutter/material.dart';

import '../commons/commons.dart';
import 'custom_painters.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomPainter2(),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircleAvatar(
                      radius: 200,
                      backgroundImage: AssetImage("images/profileimage.JPG"),
                      ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Hola, bienvenido/a a mi página.",
                        style: TextStyle(color: colorText, fontSize: 50),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Me presento, mi nombre es Tomás y soy un amante de la tecnología con 2 años de experiencia como desarrollador backend, aunque también es verdad que he hecho alguna que otra aplicación con flutter como la página que estás visualizando ahora mismo :) .",
                        style: TextStyle(color: colorText, fontSize: 17),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
