import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BottomNavigationEnum { parking, billing, home, history, repair }

class MainController extends GetxController {
  MainController({required this.page});

  int page;

  @override
  void onInit() {
    pageViewController = PageController(initialPage: page);
    super.onInit();
  }

  var selected = BottomNavigationEnum.home.obs;
  late PageController pageViewController;

  void animatedToPage(selectedEnum, pageNumber) {
    if (selected.value != selectedEnum) {
      pageNumber;
      pageViewController.animateToPage(
        pageNumber,
        duration: const Duration(
          microseconds: 500,
        ),
        curve: Curves.bounceIn,
      );

      selected.value = selectedEnum;
    }
  }
}
