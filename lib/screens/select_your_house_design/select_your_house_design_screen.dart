import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/config/styles/app_colors.dart';
import 'package:thikedaardotcom/config/styles/app_styles.dart';
import 'package:thikedaardotcom/screens/view_your_dream_house/widgets/floor_plan_view.dart';

import '../../common/common_app_bar/common_app_bar.dart';

class SelectYouHouseDesignScreen extends StatelessWidget {
  const SelectYouHouseDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CommonAppBar(
              fisrtHeader: 'Select Your',
              secondHeader: 'House Design',
              subtitle: 'Download design for free',
            ),
          ),
          SliverAlignedGrid.count(
              itemBuilder: (_, int index) => Container(
                    padding: EdgeInsets.only(
                      left: index % 2 == 0 ? horizontalPaddingVakue - 2.w : 0,
                      right: index % 2 == 0 ? 3.w : horizontalPaddingVakue,
                    ),
                    // height: 35.h,
                    // width: 35.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Recommended',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 0.5.w,
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.appAccentAmber),
                                child: Padding(
                                  padding: EdgeInsets.all(2.sp),
                                  child: Icon(
                                    Icons.favorite,
                                    size: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.appAccentAmber),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(2.sp),
                                    child: Icon(
                                      Icons.favorite,
                                      size: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        Container(
                          height: 22.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black87),
                              borderRadius: BorderRadius.circular(8)),
                          child: Image.asset('assets/images/floorplan.jpg'),
                        )
                      ],
                    ),
                  ),
              crossAxisCount: 2),
        ],
      ),
    );
  }
}
