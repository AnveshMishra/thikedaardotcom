import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/network/api_response.dart';

import '../model/get_design_data_request_model.dart';
import '../repository/select_your_house_design_repository.dart';

class SelectYourHouseDesignController extends GetxController {
  ApiResponse<GetDesignDataResponseModel> apiResponse =
      ApiResponse<GetDesignDataResponseModel>.none();

  Future<void> getDesignData() async {
    apiResponse = ApiResponse<GetDesignDataResponseModel>.loading();
    update();
    await Future.delayed(const Duration(seconds: 2));
    apiResponse = await SelectYourHouseDesignRespository().getDesignData();
    if (apiResponse.status == ApiResponseStatus.success) {
      // Get.off(() => const NavScreen());
    } else {
      Get.snackbar(
        "Unable to fetch design data",
        "Something went wrong. Please try again",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(
          Icons.dangerous,
          color: Colors.white,
        ),
      );
    }
    update();
  }
}
