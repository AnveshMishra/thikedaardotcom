import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/my_projects_screen/routes/routes.dart';

import '../../common/carousel/carousel_with_dot_indicator.dart';
import '../nav_sceen.dart/constants/constants.dart';
import 'widgets/app_button.dart';

class MyProjectsScreen extends StatelessWidget {
  const MyProjectsScreen({super.key});

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
                  const Spacer(),
                  IconButton(
                      onPressed: () => {
                            Get.toNamed(profile, id: 0),
                          },
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
                      image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/2219024/pexels-photo-2219024.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          fit: BoxFit.fill),
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
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/1216589/pexels-photo-1216589.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
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
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.green,
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
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/1145434/pexels-photo-1145434.jpeg?auto=compress&cs=tinysrgb&w=600"),
                            fit: BoxFit.fill)
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                key: const ValueKey("DESIGN YOUR HOME"),
                text: "DESIGN YOUR HOME",
                onTap: () => {
                  Get.toNamed(designYourHome, id: homeNestedKeyId),
                },
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                key: const ValueKey("BUILD YOUR HOME"),
                text: "BUILD YOUR HOME",
                onTap: () => Get.toNamed(buildYourHome, id: homeNestedKeyId),
              ),
              const SizedBox(
                height: 32,
              ),
              // AppButton(
              //   key: const ValueKey("MAINTAIN YOUR HOME"),
              //   text: "MAINTAIN YOUR HOME",
              //   onTap: () => {
              //     Get.toNamed(maintainYourHome, id: homeNestedKeyId),
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
