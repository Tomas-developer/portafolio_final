// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:portafolio/commons/commons.dart';
import 'package:portafolio/model/model.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Model>(context, listen: false);

    return Container(
      color: secondaryColor,
      height: 70,
      child: Row(children: [
        const Icon(
          Icons.abc,
          color: colorText,
        ),
        Expanded(child: Container()),
        _ItemMenu(
          name: "Inicio",
          function: () => provider.navigateTo = 0,
        ),
        _ItemMenu(name: "Sobre mi", function: () => provider.navigateTo = 1),
        _ItemMenu(name: "Contacto", function: () => provider.navigateTo = 2)
      ]),
    );
  }
}

class _ItemMenu extends StatefulWidget {
  final String name;
  Function() function;

  _ItemMenu({this.name = "Not name", required this.function});

  @override
  State<_ItemMenu> createState() => _ItemMenuState();
}

class _ItemMenuState extends State<_ItemMenu> {
  final Color colorHover = primaryColor;
  final Color colorBase = secondaryColor;
  late Color _currentColor;

  @override
  void initState() {
    _currentColor = colorBase;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) => setState(() {
        _currentColor = colorBase;
      }),
      onEnter: (event) => setState(() {
        _currentColor = colorHover;
      }),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.function,
        child: Container(
            color: _currentColor,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: double.infinity,
            child: Text(
              widget.name,
              style: const TextStyle(color: colorText),
            )),
      ),
    );
  }
}
