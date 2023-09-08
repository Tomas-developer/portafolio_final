import 'dart:ui';

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Color color;
  final String text;
  final Function onTap;
  final double width;
  final String pathImageIcon;
  const CustomButton(
      {super.key,
      this.color = Colors.black,
      this.text = "sin texto",
      required this.onTap,
      this.width = 170,
      required this.pathImageIcon});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final duration = const Duration(milliseconds: 200);
  double height = 70.0;

  double currentMargin = 10;
  double currentMarginTop = 10;
  double currentMarginBottom = 10;
  double height2 = 40;
  double width2 = 40;
  double radius = 40;
  double opacity = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap.call(),
      child: MouseRegion(
        onEnter: (event) => setState(() {
          currentMargin = 0;
          currentMarginTop = 0;
          currentMarginBottom = 0;
          height2 = height;
          width2 = widget.width;
          radius = 20;
          opacity = 0;
        }),
        onExit: (event) => setState(() {
          currentMargin = 10;
          currentMarginTop = 10;
          currentMarginBottom = 10;
          width2 = 40;
          height2 = 40;
          radius = 40;
          opacity = 1;
        }),
        child: SizedBox(
          height: height,
          width: widget.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: widget.color,
                  ),
                  margin: EdgeInsets.only(
                      top: currentMarginTop,
                      left: currentMargin,
                      right: currentMargin,
                      bottom: currentMarginBottom),
                  duration: duration,
                  height: height),
              AnimatedPositioned(
                  duration: duration,
                  bottom: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: AnimatedContainer(
                        padding: const EdgeInsets.all(7),
                        duration: duration,
                        height: height2,
                        width: width2,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(radius),
                        ),
                        child: Image.asset(widget.pathImageIcon),
                      ),
                    ),
                  )),
              AnimatedOpacity(
                  duration: duration,
                  opacity: opacity,
                  child: Text(
                    widget.text,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
