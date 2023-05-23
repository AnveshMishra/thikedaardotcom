import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/design_your_house_screen/model/design_request_model.dart';

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

  Future<void> generateDesign() async {
    if (formGlobalKey.currentState?.validate() ?? false) {
      apiResponse = ApiResponse<DesignYourHouseResponseModel>.loading();
      update();
      apiResponse = await DesignYouHouseRepo().postDesignDetails(
        DesignRequestModel(
                city: cityController.text,
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
