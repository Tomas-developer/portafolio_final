
import 'package:flutter/material.dart';
import 'package:portafolio/commons/commons.dart';

class PresentationWidget extends StatelessWidget {
  const PresentationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   
    return CustomPaint(
      painter: _MyPainter(),
    
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FittedBox(child: Text("Tomás Saiz Olivares", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: titleLetterColor))),
          FittedBox(child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Text("Desarrollo web - backend", style: TextStyle(fontSize: 30,color: titleLetterColor))))
          ,SizedBox(height: 20,)
          ,Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.laptop, color: iconsColor,),
              Icon(Icons.add, color: iconsColor),
              Icon(Icons.coffee, color: iconsColor),
              Text("= </>", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: iconsColor),),

            ],
          ) 
        ],
      )
    );
  }
}

class _MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
    Path path = Path()
    ..lineTo(size.width, 0)

    ..lineTo(size.width, 0)
    ..lineTo(size.width, size.height - 50)
    ..lineTo(size.width * 0.6, size.height - 50)
    ..lineTo(size.width * 0.5, size.height)
    ..lineTo(size.width * 0.4, size.height - 50)
    ..lineTo(0, size.height - 50);
    
    Paint paint = Paint();
    
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
  
    canvas.drawPath(path, paint);

    paint.color = primaryColor;

    Paint secondPaint = Paint();
    secondPaint.color = secondaryColor;
    canvas.drawCircle(const Offset(0,0), 9000, secondPaint);
     //   canvas.clipRect(Rect.fromCenter(center: Offset(0, 0), width: size.width, height: size.height));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}