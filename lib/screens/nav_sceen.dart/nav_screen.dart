import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/home_screen/home_screen_navigator.dart';
import 'package:thikedaardotcom/screens/my_projects_screen/my_projects_screen_navigator.dart';
import 'package:thikedaardotcom/screens/nav_sceen.dart/controller/nav_screen_controller.dart';

import '../design_your_house_screen/design_your_house_navigator.dart';
import 'widgets/nav_bar.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => BottomNavBar(
          onTap: landingPageController.changeTabIndex,
          selectedIndex: landingPageController.tabIndex.value,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final NavScreenController landingPageController =
        Get.put(NavScreenController(), permanent: false);
    return Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: const [
              HomeScreenNavigator(),
              Scaffold(),
              MyProjectsScreenNavigator(),
              DesignYourDreamHouseScreenNavigator()
            ],
          )),
    );
  }
}
