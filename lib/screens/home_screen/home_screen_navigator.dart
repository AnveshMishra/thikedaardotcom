import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/nav_sceen.dart/controller/nav_screen_controller.dart';
import 'package:thikedaardotcom/screens/profile/profile.dart';
import 'package:thikedaardotcom/screens/view_your_dream_house/view_your_dream_house.dart';

import '../build_your_home/build_your_home.dart';
import '../design_your_home_scrren/design_your_home_screen.dart';
import '../maintain_your_home/maintain_your_home.dart';
import '../my_projects_screen/my_projects_screen.dart';
import '../my_projects_screen/routes/routes.dart';

class HomeScreenNavigator extends StatelessWidget {
  const HomeScreenNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavScreenController>();
    return Navigator(
      key: controller.homeNestedKey,
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          GetPageRoute(
            settings: RouteSettings(name: initialRoute),
            page: () => const MyProjectsScreen(),
          )
        ];
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case designYourHome:
            return GetPageRoute(
              settings: RouteSettings(name: settings.name),
              page: () => const DesignYourHomeScreen(),
            );
          case profile:
            return GetPageRoute(
              settings: RouteSettings(name: settings.name),
              page: () => ProfileUI(),
            );
          case maintainYourHome:
            return GetPageRoute(
              settings: RouteSettings(name: settings.name),
              page: () => const MaintainYourHome(),
            );
          case buildYourHome:
            return GetPageRoute(
              settings: RouteSettings(name: settings.name),
              page: () => const BuildYourHome(),
            );
          default:
            return GetPageRoute(
                settings: RouteSettings(name: settings.name),
                page: () => const Scaffold());
        }
      },
    );
  }
}
