// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:portafolio/commons/commons.dart';
import 'package:portafolio/model/model.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({super.key});
  var provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<Model>(context, listen: false);
    final double width = MediaQuery.of(context).size.width;

    return Container(
      color: secondaryColor,
      child: width > 700
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _itemsMenu())
          : _DeviceMenu(
              items: [
                _ItemMenu(
                  name: "Inicio",
                  function: () => provider.navigateTo = 0,
                ),
                _ItemMenu(
                    name: "Sobre mi", function: () => provider.navigateTo = 1),
                _ItemMenu(
                    name: "Formación", function: () => provider.navigateTo = 2),
                _ItemMenu(
                    name: "Experiencia",
                    function: () => provider.navigateTo = 3),
                _ItemMenu(
                    name: "Skills", function: () => provider.navigateTo = 4),
                _ItemMenu(
                    name: "Contacto", function: () => provider.navigateTo = 5)
              ],
            ),
    );
  }

  List<Widget> _itemsMenu() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Image.asset("images/icono.png", height: 40),
      ),
      Row(
        children: [
          _ItemMenu(
            name: "Inicio",
            function: () => provider.navigateTo = 0,
          ),
          _ItemMenu(name: "Sobre mi", function: () => provider.navigateTo = 1),
          _ItemMenu(name: "Formación", function: () => provider.navigateTo = 2),
          _ItemMenu(
              name: "Experiencia", function: () => provider.navigateTo = 3),
          _ItemMenu(name: "skills", function: () => provider.navigateTo = 4),
          _ItemMenu(name: "Contacto", function: () => provider.navigateTo = 5)
        ],
      )
    ];
  }
}

class _DeviceMenu extends StatefulWidget {
  List<_ItemMenu> items;
  _DeviceMenu({required this.items});

  @override
  State<StatefulWidget> createState() => _DeviceMenuState();
}

class _DeviceMenuState extends State<_DeviceMenu> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: isOpen ? 320 : 70,
        child: OverflowBox(
          alignment: Alignment.topCenter,
          maxHeight: 370,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: IconButton(
                      icon: Icon(isOpen ? Icons.arrow_downward : Icons.menu),
                      iconSize: 40,
                      color: colorText,
                      onPressed: () => setState(() {
                        isOpen = !isOpen;
                      }),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              ...widget.items,
            ],
          ),
        ),
      ),
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
  late Color _currentColorText;

  @override
  void initState() {
    _currentColor = colorBase;
    _currentColorText = primaryColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) => setState(() {
        _currentColor = colorBase;
        _currentColorText = colorHover;
      }),
      onEnter: (event) => setState(() {
        _currentColor = colorHover;
        _currentColorText = colorBase;
      }),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.function,
        child: Container(
            decoration: BoxDecoration(
                color: _currentColor, borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            child: Text(
              widget.name,
              style: TextStyle(color: _currentColorText, fontSize: 15),
            )),
      ),
    );
  }
}
