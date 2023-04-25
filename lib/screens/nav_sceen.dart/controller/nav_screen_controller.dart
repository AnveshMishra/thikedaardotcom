import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/design_your_house_screen/design_your_dream_house_screen.dart';
import 'package:thikedaardotcom/screens/my_projects_screen/my_projects_screen.dart';
import 'package:thikedaardotcom/screens/nav_sceen.dart/constants/constants.dart';

import '../../home_screen/home_screen.dart';

class NavScreenController extends GetxController {
  var tabIndex = 0.obs;

  final homeNestedKey = Get.nestedKey(homeNestedKeyId);
  final myProjectsNestedKey = Get.nestedKey(myProjectNestedKeyId);
  final myDesignNestedKey = Get.nestedKey(myDesignNestedKeyId);

  void changeTabIndex(int index) {
    if (index == tabIndex.value && _checkIfCanPopToRoot(index)) {
      _navigateToRoot(index);
    } else {
      tabIndex.value = index;
    }
  }

  bool _checkIfCanPopToRoot(int index) {
    switch (index) {
      case 0:
        return homeNestedKey?.currentState?.canPop() ?? false;
      case 2:
        return myProjectsNestedKey?.currentState?.canPop() ?? false;
      case 3:
        return myDesignNestedKey?.currentState?.canPop() ?? false;
      default:
        return false;
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
      case 2:
        return const MyProjectsScreen(
          key: ValueKey("MyProjectsScreenHome"),
        );
      case 3:
        return const DesignYourDreamHouseScreen();
      default:
        return const Scaffold();
    }
  }
}
