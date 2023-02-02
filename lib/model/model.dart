import 'package:flutter/material.dart';

class Model with ChangeNotifier {
  
  PageController controller = PageController();
  int currentPage = 0;

  set navigateTo(int page) {
    currentPage = page;
    controller.animateToPage(page, duration: const Duration(seconds: 1), curve: Curves.decelerate);
    notifyListeners();
  }

  set setCurrentPage(int page) {
    currentPage = page;
    notifyListeners();
  }

}