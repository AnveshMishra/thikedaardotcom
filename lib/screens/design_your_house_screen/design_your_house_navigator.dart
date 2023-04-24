import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/design_your_house_screen/design_your_dream_house_screen.dart';
import 'package:thikedaardotcom/screens/home_screen/home_screen.dart';
import 'package:thikedaardotcom/screens/nav_sceen.dart/controller/nav_screen_controller.dart';

class DesignYourDreamHouseScreenNavigator extends StatelessWidget {
  const DesignYourDreamHouseScreenNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavScreenController>();
    return Navigator(
      key: controller.myDesignNestedKey,
      initialRoute: '/',
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          GetPageRoute(
              settings: RouteSettings(name: initialRoute),
              page: () => const DesignYourDreamHouseScreen())
        ];
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          default:
            return GetPageRoute(
                settings: RouteSettings(name: settings.name),
                page: () => const Scaffold());
        }
      },
    );
  }
}
