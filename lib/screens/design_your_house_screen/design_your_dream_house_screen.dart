import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/network/api_response.dart';
import 'package:thikedaardotcom/screens/design_your_house_screen/widgets/option_bottom_sheet.dart';
import 'package:thikedaardotcom/screens/nav_sceen.dart/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/size/size_config.dart';
import '../../config/styles/app_colors.dart';
import '../../config/styles/app_styles.dart';
import '../nav_sceen.dart/controller/nav_screen_controller.dart';
import '../select_your_house_design/controller/select_your_house_design_controller.dart';
import 'controller/design_your_house_controller.dart';

class DesignYourDreamHouseScreen extends StatelessWidget {
  DesignYourDreamHouseScreen({super.key}) {
    Get.put(DesignYourHouseController());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Get.find<DesignYourHouseController>().getLocation();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: SizeConfig.blackSizeVertical! * 36,
                child: Stack(
                  children: [
                    Container(color: AppColors.colorFromHex('#384247')),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 50),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                                onPressed: () async {
                                  // Navigator.pushNamed(context, '/home');
                                  await launchUrl(Uri.parse("tel:$mobileNo"));
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
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: Get.width - 30,
                                padding:
                                    const EdgeInsets.only(left: 30, right: 15),
                                child: Text(
                                  "To get AI generated design for your dream home please fill the form.",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headlineLarge,
                                  maxLines: 4,
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: GetBuilder<DesignYourHouseController>(
                            builder: (controller) => Form(
                              key: controller.formGlobalKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // City drop down
                                  Obx(
                                    () => Container(
                                      height: 70,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color:
                                              AppColors.colorFromHex('#F1AD0A'),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: CustomDropDown(
                                        hint: const Text("Select City"),
                                        value:
                                            controller.selectedCityName.value,
                                        onChanged: (dynamic value) => {
                                          controller.selectedCityName.value =
                                              value
                                        },
                                        items: controller.cityList
                                            .map(buildMenuItem)
                                            .toList(),
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

DropdownMenuItem<String> buildMenuItem(String listVal) => DropdownMenuItem(
    value: listVal,
    child: Text(listVal,
        style: Theme.of(Get.context!)
            .primaryTextTheme
            .bodyMedium
            ?.copyWith(color: Colors.black54)));

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
    this.width,
    this.hint,
  });

  final double? width;
  final Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final Widget? hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: (width ?? (Get.width > 500 ? Get.width / 1.17 : Get.width / 1.38)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        // border: Border.all(color: Colors.grey, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: hint ?? const SizedBox(),
          value: value,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
          isExpanded: true,
          icon: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: const Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.amber,
            ),
          ),
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
