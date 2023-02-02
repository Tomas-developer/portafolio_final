import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../pages/sendond.dart';

class RouterFluro {
  static final FluroRouter _fluro = FluroRouter();

  static void configureRoutes() {
    _fluro.define("/second",
        transitionType: TransitionType.fadeIn,
        handler:
            Handler(handlerFunc: ((context, parameters) => const MyWidget())));
  _fluro.define("/:second",
        transitionType: TransitionType.fadeIn,
        handler:
            Handler(handlerFunc: ((context, parameters) => const MyWidget())));
  }

  static void navigateTo(BuildContext context, String path) {
    _fluro.navigateTo(context, path);
  }
}
