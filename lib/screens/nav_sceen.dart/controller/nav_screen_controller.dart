import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/design_your_house_screen/design_your_dream_house_screen.dart';

import '../../home_screen/home_screen.dart';

class NavScreenController extends GetxController {
  var tabIndex = 0.obs;

  final homeNestedKey = Get.nestedKey(0);
  final myDesignNestedKey = Get.nestedKey(3);
  void changeTabIndex(int index) {
    if (index == tabIndex.value &&
        (homeNestedKey?.currentState?.canPop() ?? false)) {
      _navigateToRoot(index);
    } else {
      tabIndex.value = index;
    }
  }

  void _navigateToRoot(int index) {
    Get.offUntil(
        GetPageRoute(
            settings: const RouteSettings(name: "/"),
            page: () => _getRootScreen(index)),
        (route) => false,
        id: index);
  }

  Widget _getRootScreen(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 3:
        return const DesignYourDreamHouseScreen();
      default:
        return const Scaffold();
    }
  }
}
