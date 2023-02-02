import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portafolio/commons/commons.dart';

import 'package:portafolio/model/model.dart';
import 'package:portafolio/widgets/presentation_widget.dart';
import 'package:portafolio/widgets/second_page_view.dart';
import 'package:provider/provider.dart';

class CustomPageView extends StatelessWidget {
  CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Model>(context, listen: false);

    return Expanded(
      child: PageView(
        controller: provider.controller,
        scrollDirection: Axis.vertical,
        onPageChanged: (value) => provider.setCurrentPage = value,
        children: [
          const PresentationWidget(),
          AboutMeWidget(),
          SecondPageView()
        ],
      ),
    );
  }
}

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Container(
      padding: const EdgeInsets.all(40),
      color: secondaryColor,
      child: Row(children: const [
        _ImageAnimated(),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Text(
            "Bienvenido/a a mi portafolios",
            style: TextStyle(color: colorText),
          ),
        )
      ]),
    );
  }

  
}

class _ImageAnimated extends StatefulWidget {
  const _ImageAnimated();

  @override
  State<_ImageAnimated> createState() => _ImageAnimatedState();
}

class _ImageAnimatedState extends State<_ImageAnimated> with SingleTickerProviderStateMixin {

  var angle = 0.2;
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = Tween<double>(
      begin: 0,
      end: 0.2,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {
          if (_animation.isCompleted) {
            _animationController.reverse();
          }

          if (_animation.isDismissed) {
            _animationController.forward();
          }
        });
      });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Transform.rotate(
        angle: _animation.value,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset("images/imageavatar.png"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
