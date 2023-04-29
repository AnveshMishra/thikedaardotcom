import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/screens/my_project_details/widgets/details_container.dart';
import 'package:thikedaardotcom/screens/select_your_house_design/select_your_house_design_screen.dart';

import '../../config/styles/app_colors.dart';

class MyProjectDetails extends StatelessWidget {
  const MyProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(const SelectYouHouseDesignScreen(), id: 0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.bottomNavigationBarColor,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(48),
                        bottomLeft: Radius.circular(48))),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 0.8.h,
                        ),
                        Text(
                          "My Projects",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineLarge
                              ?.copyWith(
                                  color: AppColors.appAccentAmber,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 1.8.h,
                        ),
                        Text(
                          "Good Morning!",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                        ),
                        SizedBox(
                          height: 1.8.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Name Name (ID_123)",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headlineLarge
                                  ?.copyWith(
                                      color: AppColors.appAccentAmber,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 2.w),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.appAccentAmber,
                                  borderRadius: BorderRadius.circular(2.w),
                                ),
                                child: const Icon(Icons.arrow_drop_down_sharp),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.8.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(2.w),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "Plot no.70, Vijay Vihar, Sector 30, Gurugram",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                      ),
                                ),
                              ),
                              Transform.rotate(
                                angle: -45 * 3.1415927 / 180,
                                child: Icon(
                                  Icons.send,
                                  size: 36,
                                  color: AppColors.appAccentAmber,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.8.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  "Project Details",
                  style: Theme.of(context).primaryTextTheme.headlineLarge,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              const DetailsContainer(),
              SizedBox(
                height: 2.h,
              ),
              const DetailsContainer(),
              SizedBox(
                height: 2.h,
              ),
              const DetailsContainer(),
              SizedBox(
                height: 2.h,
              ),
              const DetailsContainer(),
              SizedBox(
                height: 2.h,
              ),
              const DetailsContainer(),
              SizedBox(
                height: 2.h,
              ),
              const DetailsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
