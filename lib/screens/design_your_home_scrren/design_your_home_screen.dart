import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/view_your_dream_house/view_your_dream_house.dart';

import '../../common/carousel/carousel_with_dot_indicator.dart';
import '../design_your_house_screen/design_your_dream_house_screen.dart';
import '../my_projects_screen/widgets/app_button.dart';
import '../nav_sceen.dart/constants/constants.dart';

class DesignYourHomeScreen extends StatelessWidget {
  const DesignYourHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Home > Design Your Home",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.person,
                        size: 36,
                      )),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              CarauselWithDotIndicator(
                items: [
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/2219035/pexels-photo-2219035.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                            fit: BoxFit.fill)
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/962889/pexels-photo-962889.jpeg?auto=compress&cs=tinysrgb&w=600"),
                            fit: BoxFit.fill)
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/2590716/pexels-photo-2590716.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=252&fit=crop&h=408"),
                            fit: BoxFit.fill)
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                key: const ValueKey("2D LAYOUT"),
                text: "2D LAYOUT",
                onTap: () => {
                  Get.to(DesignYourDreamHouseScreen(), id: homeNestedKeyId),
                },
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                key: const ValueKey("3D LAYOUT"),
                text: "3D LAYOUT",
                onTap: () => {},
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                key: const ValueKey("VIRTUAL WALKTHROUGH"),
                text: "VIRTUAL WALKTHROUGH",
                onTap: () => {
                  Get.to(const ViewYourDreamHouse(), id: homeNestedKeyId),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
