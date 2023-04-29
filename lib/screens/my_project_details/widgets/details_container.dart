import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/styles/app_colors.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              height: 8.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black87),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      "Construction Site Details",
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                    ),
                  ),
                  Container(
                    height: 8.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.appAccentAmber),
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.note_sharp,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              height: 8.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black87),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      "Construction Site Details",
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                    ),
                  ),
                  Container(
                    height: 8.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.appAccentAmber),
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.note_sharp,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
