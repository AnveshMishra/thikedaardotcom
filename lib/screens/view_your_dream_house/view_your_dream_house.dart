import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/config/styles/app_colors.dart';

import 'widgets/floor_plan_view.dart';

class ViewYourDreamHouse extends StatelessWidget {
  const ViewYourDreamHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.maxFinite,
            height: 30.h,
            decoration: BoxDecoration(
                color: AppColors.bottomNavigationBarColor,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(48),
                    bottomLeft: Radius.circular(48))),
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.8.h,
                  ),
                  Text(
                    "View Your",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineLarge
                        ?.copyWith(
                            color: AppColors.appAccentAmber,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Dream House",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineLarge
                        ?.copyWith(
                            color: AppColors.appAccentAmber,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Download the designs for free!',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 1.8.h,
                  ),
                  FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.phone),
                      label: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.4.h),
                        child: Text(
                          'Call us',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          const FloorPlanView(),
          SizedBox(
            height: 4.h,
          ),
          const FloorPlanView(),
        ],
      ),
    );
  }
}
