import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/network/api_response.dart';
import 'package:thikedaardotcom/screens/design_your_house_screen/widgets/option_bottom_sheet.dart';

import '../../config/size/size_config.dart';
import '../../config/styles/app_colors.dart';
import '../../config/styles/app_styles.dart';
import '../nav_sceen.dart/controller/nav_screen_controller.dart';
import '../select_your_house_design/controller/select_your_house_design_controller.dart';
import 'controller/design_your_house_controller.dart';

class DesignYourDreamHouseScreen extends StatelessWidget {
  const DesignYourDreamHouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Get.find<DesignYourHouseController>().getLocation();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blackSizeVertical! * 36,
                width: double.infinity,
                child: Stack(children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: AppColors.colorFromHex('#384247'),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Design Your \nDream House',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Montserrat',
                                color: AppColors.colorFromHex('#F1AD0A'),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          const Text('Get Free Consultation today',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal)),
                          SizedBox(
                            height: 4.h,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: TextButton(
                              key: const ValueKey("btnLogin"),
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor:
                                    AppColors.colorFromHex('#F1AD0A'),
                              ),
                              onPressed: () {
                                // Navigator.pushNamed(context, '/home');
                              },
                              child: Text(
                                "Call Us",
                                style: mOswaldBold.copyWith(
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(42),
                            topRight: Radius.circular(42)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 15),
                                    child: Text(
                                        "To get AI generated design for your dream home please fill the form.",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headlineLarge))),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: GetBuilder<DesignYourHouseController>(
                            builder: (controller) => Form(
                              key: controller.formGlobalKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: _validator,
                                      controller: controller.cityController,
                                      cursorColor: Colors.grey[600],
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: 'Enter your city',
                                        hintStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyMedium
                                            ?.copyWith(color: Colors.black54),
                                        fillColor:
                                            AppColors.colorFromHex('#F1AD0A'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.number,
                                        validator: _validator,
                                        cursorColor: Colors.grey[600],
                                        controller: controller.plotLenth,
                                        decoration: InputDecoration(
                                          filled: true,
                                          hintText: "Enter Plot length",
                                          hintStyle: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.black54),
                                          fillColor:
                                              AppColors.colorFromHex('#F1AD0A'),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.number,
                                        validator: _validator,
                                        cursorColor: Colors.grey[600],
                                        controller: controller.plotWidth,
                                        decoration: InputDecoration(
                                          filled: true,
                                          hintText: "Enter Plot width",
                                          hintStyle: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.black54),
                                          fillColor:
                                              AppColors.colorFromHex('#F1AD0A'),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.number,
                                        validator: _validator,
                                        cursorColor: Colors.grey[600],
                                        controller: controller.numberOfFloors,
                                        decoration: InputDecoration(
                                          filled: true,
                                          hintText: "Enter Number of floors",
                                          hintStyle: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.black54),
                                          fillColor:
                                              AppColors.colorFromHex('#F1AD0A'),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: _validator,
                                        controller: controller.requiredBasement,
                                        readOnly: true,
                                        onTap: () => showOptionBottomSheet(
                                            context, onTap: (String value) {
                                          controller.requiredBasement.text =
                                              value;
                                        }, title: "Require basement?"),
                                        cursorColor: Colors.grey[600],
                                        decoration: InputDecoration(
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              margin: const EdgeInsets.all(8),
                                              decoration: const BoxDecoration(
                                                color: Colors.black,
                                              ),
                                              child: Icon(
                                                  Icons
                                                      .arrow_drop_down_outlined,
                                                  color:
                                                      AppColors.appAccentAmber),
                                            ),
                                          ),
                                          filled: true,
                                          hintText: "Require basement?",
                                          hintStyle: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.black54),
                                          fillColor:
                                              AppColors.colorFromHex('#F1AD0A'),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: _validator,
                                      onTap: () => showOptionBottomSheet(
                                        context,
                                        onTap: (String value) {
                                          controller.requiredStilt.text = value;
                                        },
                                        title: "Require stilt?",
                                      ),
                                      readOnly: true,
                                      cursorColor: Colors.grey[600],
                                      controller: controller.requiredStilt,
                                      decoration: InputDecoration(
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            margin: const EdgeInsets.all(8),
                                            decoration: const BoxDecoration(
                                              color: Colors.black,
                                            ),
                                            child: Icon(
                                                Icons.arrow_drop_down_outlined,
                                                color:
                                                    AppColors.appAccentAmber),
                                          ),
                                        ),
                                        filled: true,
                                        hintText: "Require stilt?",
                                        hintStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyMedium
                                            ?.copyWith(color: Colors.black54),
                                        fillColor:
                                            AppColors.colorFromHex('#F1AD0A'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.50,
                                  height: 50,
                                  child: TextButton(
                                    key: const ValueKey("btnViewNow"),
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      backgroundColor: Colors.black,
                                    ),
                                    onPressed: () async {
                                      await Get.find<
                                              DesignYourHouseController>()
                                          .generateDesign();
                                      Get.find<NavScreenController>()
                                          .changeTabIndex(0);
                                      Get.find<
                                              SelectYourHouseDesignController>()
                                          .getDesignData();
                                      Get.find<NavScreenController>()
                                          .changeTabIndex(3);
                                    },
                                    child:
                                        GetBuilder<DesignYourHouseController>(
                                            builder: (controller) {
                                      if (controller.apiResponse.status !=
                                          ApiResponseStatus.loading) {
                                        return Text(
                                          "VIEW NOW",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headlineLarge
                                              ?.copyWith(color: Colors.white),
                                        );
                                      }
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }),
                                  ),
                                )
                              ],
                            ))
                      ],
                    )),
              ),
            ],
          ),
        ));
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
