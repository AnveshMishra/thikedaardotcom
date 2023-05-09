import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/network/api_response.dart';
import 'package:thikedaardotcom/screens/login_screen/model/login_response_model.dart';
import 'package:thikedaardotcom/screens/login_screen/repository/login_repository.dart';
import 'package:thikedaardotcom/screens/nav_sceen.dart/nav_screen.dart';

class LoginController extends GetxController {
  ApiResponse<LoginResponseModel> apiResponse =
      ApiResponse<LoginResponseModel>.none();

  Future<void> login(
      {required String userName, required String password}) async {
    apiResponse = ApiResponse<LoginResponseModel>.loading();
    update();
    apiResponse =
        await LoginRespository().login(userName: userName, password: password);
    if (apiResponse.status == ApiResponseStatus.success) {
      Get.off(() => const NavScreen());
    } else {
      Get.snackbar(
        "Login Failed",
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
