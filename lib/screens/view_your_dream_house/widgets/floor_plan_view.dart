import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/styles/app_colors.dart';

class FloorPlanView extends StatelessWidget {
  const FloorPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black45, width: 0.6.w)),
                child: Image.asset(
                  'assets/images/floorplan.jpg',
                  // height: 150,
                  // width: 150,
                  fit: BoxFit.contain,
                )),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Floor Plans",
                    style: Theme.of(context).primaryTextTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "Download png",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodySmall
                        ?.copyWith(
                            color: AppColors.appAccentAmber, fontSize: 10.sp),
                  ),
                  Text(
                    "Download jpg",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodySmall
                        ?.copyWith(
                            color: AppColors.appAccentAmber, fontSize: 10.sp),
                  ),
                  Text(
                    "Download CAD",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodySmall
                        ?.copyWith(
                            color: AppColors.appAccentAmber, fontSize: 10.sp),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
