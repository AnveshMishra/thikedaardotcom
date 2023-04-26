import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:thikedaardotcom/config/styles/app_colors.dart';
import 'package:thikedaardotcom/screens/materials_screen/widgets/banner.dart';
import 'package:thikedaardotcom/screens/materials_screen/widgets/filter_button.dart';

import '../../config/size/size_config.dart';
import 'widgets/header_widget.dart';
import 'widgets/icons_button.dart';
import 'widgets/search_bar.dart';

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalPaddingVakue = (SizeConfig.blackSizeHorizontal ?? 1) * 10;
    final horizontalPadding =
        EdgeInsets.symmetric(horizontal: horizontalPaddingVakue);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(double.maxFinite, (SizeConfig.blackSizeVertical ?? 1) * 12.5),
        child: ColoredBox(
          color: AppColors.bottomNavigationBarColor,
          child: Padding(
            padding: horizontalPadding,
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: (SizeConfig.blackSizeVertical ?? 1) * 2.8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
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
                  SizedBox(
                    height: (SizeConfig.blackSizeVertical ?? 1) * 2.8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // backgroundColor: ,
      body: CustomScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            IconsButton(),
                            IconsButton(),
                            IconsButton(),
                            IconsButton(),
                            IconsButton(),
                          ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            FilterButton(isSelected: true, text: 'All'),
                            FilterButton(isSelected: false, text: 'newest'),
                            FilterButton(isSelected: false, text: 'popular'),
                            FilterButton(isSelected: false, text: 'trending'),
                          ],
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
                  itemCount: 200,
                  itemBuilder: (_, index) {
                    return Container(
                      color: Colors.green,
                      height: (SizeConfig.blackSizeVertical ?? 1) * 10,
                      child: Text("$index"),
                    );
                  },
                  crossAxisCount: 4),
            ),
          ]),
    );
  }
}
