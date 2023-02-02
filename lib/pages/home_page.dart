// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:portafolio/commons/commons.dart';
import 'package:portafolio/model/model.dart';
import 'package:portafolio/widgets/page_view.dart';
import 'package:provider/provider.dart';

import '../widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
        body: MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Model())],
      child: const _BodyPage(),
    ));
  }
}

class _BodyPage extends StatelessWidget {
  const _BodyPage();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Model>(context);

    return Stack(children: [
      Column(children: [
        const MenuWidget(),
        CustomPageView(),
      ]),
      Positioned(
        bottom: 20,
        right: 20,
        child: AnimatedOpacity(
            opacity: provider.currentPage == 0 ? 0 : 1,
            duration: const Duration(seconds: 1),
            child: IconButton(
                onPressed: () => provider.navigateTo = 0,
                icon: const Icon(Icons.arrow_upward))),
      )
    ]);
  }
}
