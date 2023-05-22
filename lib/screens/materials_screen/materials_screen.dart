import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/config/styles/app_colors.dart';
import 'package:thikedaardotcom/network/api_response.dart';
import 'package:thikedaardotcom/screens/materials_screen/widgets/banner.dart';
import 'package:thikedaardotcom/screens/materials_screen/widgets/filter_button.dart';

import '../../config/size/size_config.dart';
import '../../config/styles/app_styles.dart';
import 'controller/material_controller.dart';
import 'widgets/header_widget.dart';
import 'widgets/icons_button.dart';
import 'widgets/product_widget.dart';
import 'widgets/search_bar.dart';

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 12.h),
        child: ColoredBox(
          color: AppColors.bottomNavigationBarColor,
          child: Padding(
            padding: horizontalPadding,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 0.5.h,
                  ),
                  SizedBox(
                    height: 5.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 20,
                          child: SearchBar(
                            textController: TextEditingController(),
                            hintText: 'Search',
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // backgroundColor: ,
      body: GetBuilder<MaterialController>(
        builder: (controller) {
          if (controller.apiResponse.status != ApiResponseStatus.success ||
              controller.productApiResponse.status !=
                  ApiResponseStatus.success) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(top: 2.h),
                    decoration: BoxDecoration(
                        color: AppColors.bottomNavigationBarColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24))),
                    child: Column(
                      children: [
                        Padding(
                          padding: horizontalPadding,
                          child: const PromoBanner(),
                        ),
                        SizedBox(
                          height: (SizeConfig.blackSizeVertical ?? 1) * 2.8,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.maxFinite,
                        padding: horizontalPadding,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            )),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: (SizeConfig.blackSizeVertical ?? 1) * 2.8,
                            ),
                            const HeaderWidget(
                              text: 'Categories',
                            ),
                            SizedBox(
                              height: (SizeConfig.blackSizeVertical ?? 1) * 1.4,
                            ),
                            GetBuilder<MaterialController>(
                              builder: (controller) =>
                                  controller.apiResponse.status ==
                                          ApiResponseStatus.success
                                      ? SizedBox(
                                          width: 100.w,
                                          height: 12.h,
                                          child: ListView.builder(
                                            clipBehavior: Clip.none,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .apiResponse.data?.data?.length,
                                            itemBuilder: (context, index) =>
                                                (controller
                                                            .apiResponse
                                                            .data
                                                            ?.data?[index]
                                                            .active ??
                                                        false)
                                                    ? IconsButton(
                                                        text: controller
                                                                .apiResponse
                                                                .data
                                                                ?.data?[index]
                                                                .name ??
                                                            '')
                                                    : const SizedBox(),
                                          ),
                                        )
                                      : const CupertinoActivityIndicator(),
                            ),
                            SizedBox(
                              height: (SizeConfig.blackSizeVertical ?? 1) * 1.4,
                            ),
                            const HeaderWidget(
                              text: 'Featured products',
                            ),
                            SizedBox(
                              height: (SizeConfig.blackSizeVertical ?? 1) * 1.4,
                            ),
                            SizedBox(
                              width: 100.w,
                              height: 5.0.h,
                              child: ListView(
                                clipBehavior: Clip.none,
                                scrollDirection: Axis.horizontal,
                                children: const [
                                  FilterButton(isSelected: true, text: 'All'),
                                  FilterButton(
                                      isSelected: false, text: 'newest'),
                                  FilterButton(
                                      isSelected: false, text: 'popular'),
                                  FilterButton(
                                      isSelected: false, text: 'trending'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: (SizeConfig.blackSizeVertical ?? 1) * 2.8,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SliverPadding(
                  padding: horizontalPadding,
                  sliver: SliverAlignedGrid.count(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemCount:
                          controller.productApiResponse.data?.data?.length ?? 0,
                      itemBuilder: (_, index) {
                        return ProductWidget(
                          text: controller
                                  .productApiResponse.data?.data?[index].name ??
                              '',
                          price: controller.productApiResponse.data
                                  ?.data?[index].price ??
                              '',
                        );
                      },
                      crossAxisCount: 4),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
