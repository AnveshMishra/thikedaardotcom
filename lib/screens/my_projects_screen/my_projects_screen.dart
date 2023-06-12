import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/network/api_response.dart';
import 'package:thikedaardotcom/screens/my_projects_screen/routes/routes.dart';

import '../../common/carousel/carousel_with_dot_indicator.dart';
import '../nav_sceen.dart/constants/constants.dart';
import 'controller/my_project_controller.dart';
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
              GetBuilder<MyProjectController>(
                builder: (controller) {
                  if (controller.apiResponse.status ==
                      ApiResponseStatus.success) {
                    return CarauselWithDotIndicator(items: [
                      for (var data in controller.apiResponse.data?.data ?? [])
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: NetworkImage(data.value),
                                fit: BoxFit.fill),
                          ),
                        ),
                    ]);
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.maxFinite,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
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
