import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/home_screen/home_screen.dart';
import 'package:thikedaardotcom/screens/nav_sceen.dart/controller/nav_screen_controller.dart';
import 'package:thikedaardotcom/screens/view_your_dream_house/view_your_dream_house.dart';

class HomeScreenNavigator extends StatelessWidget {
  const HomeScreenNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavScreenController>();
    return Navigator(
      key: controller.homeNestedKey,
      initialRoute: '/',
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          GetPageRoute(
              settings: RouteSettings(name: initialRoute),
              page: () => const ViewYourDreamHouse())
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
