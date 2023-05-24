import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/styles/app_colors.dart';
import '../../screens/nav_sceen.dart/constants/constants.dart';

class CommonAppBar extends StatelessWidget {
  final String fisrtHeader;
  final String secondHeader;
  final String subtitle;
  const CommonAppBar(
      {super.key,
      required this.fisrtHeader,
      required this.secondHeader,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.bottomNavigationBarColor,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(48),
              bottomLeft: Radius.circular(48))),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.8.h,
              ),
              Text(
                fisrtHeader,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineLarge
                    ?.copyWith(
                        color: AppColors.appAccentAmber,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w900),
              ),
              Text(
                secondHeader,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineLarge
                    ?.copyWith(
                        color: AppColors.appAccentAmber,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 1.8.h,
              ),
              FilledButton.icon(
                onPressed: () async {
                  await launchUrl(Uri.parse("tel:$mobileNo"));
                },
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
                ),
              ),
              SizedBox(
                height: 1.8.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
