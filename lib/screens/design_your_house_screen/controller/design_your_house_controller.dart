import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/network/api_client.dart';
import 'package:thikedaardotcom/network/api_end_points.dart';
import 'package:thikedaardotcom/screens/design_your_house_screen/model/design_request_model.dart';
import 'package:thikedaardotcom/screens/materials_screen/model/cities_model.dart';
import 'package:thikedaardotcom/screens/materials_screen/repository/material_repo.dart';
import 'package:thikedaardotcom/screens/nav_sceen.dart/controller/nav_screen_controller.dart';
import 'package:thikedaardotcom/screens/select_your_house_design/controller/select_your_house_design_controller.dart';

import '../../../network/api_response.dart';
import '../model/design_your_house_response_model.dart';
import '../repositories/design_your_house_repo.dart';

class DesignYourHouseController extends GetxController {
  Position? position;
  TextEditingController cityController = TextEditingController();
  TextEditingController plotLenth = TextEditingController();

  TextEditingController plotWidth = TextEditingController();
  TextEditingController numberOfFloors = TextEditingController();
  TextEditingController requiredBasement = TextEditingController();
  TextEditingController requiredStilt = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  ApiResponse<DesignYourHouseResponseModel> apiResponse =
      ApiResponse<DesignYourHouseResponseModel>.none();
  late CityModel cityModel;
  RxList<String> cityList = <String>[].obs;
  RxString selectedCityName = "Select City".obs;
  @override
  void onInit() {
    _fetchCityList();
    super.onInit();
  }

  _fetchCityList() async {
    final responseResult = await MaterialRepo().fetchCityList();
    cityModel = CityModel.fromJson(responseResult);
    if (cityModel.cities.isNotEmpty) {
      List<String> lCityList = [
        "Select City", // Initial hint text
      ];
      for (var element in cityModel.cities) {
        lCityList.add(element.name);
      }
      cityList.value = lCityList;
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future getLocation() async {
    if (await _handleLocationPermission()) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (position != null) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position!.latitude,
          position!.longitude,
        );
        cityController.text = placemarks.first.locality ?? '';
      }
    }
  }

  bool validated() {
    if (selectedCityName.value.contains("Select City")) {
      Get.snackbar(
        "Empty city",
        "Please select city before going forward!",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(
          Icons.close_rounded,
          color: Colors.white,
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> generateDesign() async {
    // First validate
    if (validated() == false) return;
    if (formGlobalKey.currentState?.validate() ?? false) {
      apiResponse = ApiResponse<DesignYourHouseResponseModel>.loading();
      update();
      apiResponse = await DesignYouHouseRepo().postDesignDetails(
        DesignRequestModel(
                city: selectedCityName.value,
                plotLength: int.tryParse(plotLenth.text) ?? 0,
                plotWidth: int.tryParse(plotWidth.text) ?? 0,
                numberofFloors: int.tryParse(numberOfFloors.text) ?? 0,
                requireBasement: requiredBasement.text,
                requierStilt: requiredStilt.text)
            .toJson(),
      );
      clearData();
      update();
    }
    Get.find<NavScreenController>().changeTabIndex(0);
    Get.find<SelectYourHouseDesignController>().getDesignData();
    Get.find<NavScreenController>().changeTabIndex(3);
  }

  void clearData() {
    cityController.clear();
    plotLenth.clear();
    plotWidth.clear();
    numberOfFloors.clear();
    requiredBasement.clear();
    requiredStilt.clear();
  }
}
