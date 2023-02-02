import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portafolio/pages/home_page.dart';
import 'package:portafolio/routes/router.dart';

void main() {
  RouterFluro.configureRoutes();
  runApp(const PortafoliosApp());
}

class PortafoliosApp extends StatelessWidget {
  const PortafoliosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'fenix'
      ),
      scrollBehavior: const ScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse, PointerDeviceKind.touch}),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}