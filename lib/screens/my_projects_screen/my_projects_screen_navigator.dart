import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/build_your_home/build_your_home.dart';
import 'package:thikedaardotcom/screens/design_your_home_scrren/design_your_home_screen.dart';
import 'package:thikedaardotcom/screens/maintain_your_home/maintain_your_home.dart';
import 'package:thikedaardotcom/screens/my_project_details/my_project_details.dart';
import 'package:thikedaardotcom/screens/my_projects_screen/routes/routes.dart';
import 'package:thikedaardotcom/screens/nav_sceen.dart/controller/nav_screen_controller.dart';

class MyProjectsScreenNavigator extends StatelessWidget {
  const MyProjectsScreenNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavScreenController>();
    return Navigator(
      key: controller.myProjectsNestedKey,
      initialRoute: '/',
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          GetPageRoute(
              settings: RouteSettings(name: initialRoute),
              page: () => const MyProjectDetails())
        ];
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case designYourHome:
            return GetPageRoute(
              settings: RouteSettings(name: settings.name),
              page: () => const DesignYourHomeScreen(),
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
