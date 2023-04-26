import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/size/size_config.dart';
import '../../../config/styles/app_colors.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorFromHex('#F1AD0A'),
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.maxFinite,
      height: 14.h,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: (SizeConfig.blackSizeHorizontal ?? 1) * 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.8.h,
                    ),
                    Text(
                      'Free Voucher',
                      style: Theme.of(context).primaryTextTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 0.8.h,
                    ),
                    Text("Tap to claim your \nFree discount voucher",
                        style:
                            Theme.of(context).primaryTextTheme.headlineMedium),
                  ],
                ),
                SizedBox(
                  width: 16.w,
                  child: Image.asset(
                    'assets/images/percentpic.png',
                    height: SizeConfig.blackSizeVertical! * 45,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
