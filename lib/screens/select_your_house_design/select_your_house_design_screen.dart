import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/config/styles/app_colors.dart';
import 'package:thikedaardotcom/config/styles/app_styles.dart';
import 'package:thikedaardotcom/network/api_response.dart';

import '../../common/common_app_bar/common_app_bar.dart';
import 'controller/select_your_house_design_controller.dart';

class SelectYouHouseDesignScreen extends StatefulWidget {
  const SelectYouHouseDesignScreen({super.key});

  @override
  State<SelectYouHouseDesignScreen> createState() =>
      _SelectYouHouseDesignScreenState();
}

class _SelectYouHouseDesignScreenState
    extends State<SelectYouHouseDesignScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<SelectYourHouseDesignController>().getDesignData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SelectYourHouseDesignController>(
        builder: (controller) {
          if (controller.apiResponse.status == ApiResponseStatus.loading) {
            return Column(
              children: const [
                CommonAppBar(
                  fisrtHeader: 'Select Your',
                  secondHeader: 'House Design',
                  subtitle: 'Download design for free',
                ),
                Spacer(),
                Center(
                  child: CircularProgressIndicator(),
                ),
                Spacer(),
              ],
            );
          }
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: CommonAppBar(
                  fisrtHeader: 'Select Your',
                  secondHeader: 'House Design',
                  subtitle: 'Download design for free',
                ),
              ),
              SliverAlignedGrid.count(
                  itemCount: controller.apiResponse.data?.data?.length ?? 0,
                  itemBuilder: (_, int index) => (controller
                              .apiResponse.data?.data?[index].buildingType ==
                          null)
                      ? const SizedBox.shrink()
                      : Container(
                          padding: EdgeInsets.only(
                            left: index % 2 == 0
                                ? horizontalPaddingVakue - 2.w
                                : 0,
                            right:
                                index % 2 == 0 ? 3.w : horizontalPaddingVakue,
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
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      '${controller.apiResponse.data?.data?[index].buildingType}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                child:
                                    Image.asset('assets/images/floorplan.jpg'),
                              )
                            ],
                          ),
                        ),
                  crossAxisCount: 2),
            ],
          );
        },
      ),
    );
  }
}
