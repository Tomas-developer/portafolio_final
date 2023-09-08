// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../commons/commons.dart';

class ItemIconLauncherUrl extends StatelessWidget {
  double width;
  double height;
  String pathIcon;
  String urlLauncher;

  ItemIconLauncherUrl(
      {super.key, this.width = 50,
      this.height = 50,
      required this.pathIcon,
      required this.urlLauncher});

  @override
  Widget build(BuildContext context) {
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrlFunction.call(urlLauncher),
        child: FadeIn(
          duration: const Duration(seconds: 2),
          child: Image.network(
            pathIcon,
            width: 50,
          ),
        ),
      ),
    );
  }
}