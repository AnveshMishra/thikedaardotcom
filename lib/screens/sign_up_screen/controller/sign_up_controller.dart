import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/network/api_response.dart';
import 'package:thikedaardotcom/screens/login_screen/login_screen.dart';
import 'package:thikedaardotcom/screens/sign_up_screen/repository/sign_up_repository.dart';

class SignUpController extends GetxController {
  ApiResponse<Map<String, dynamic>> apiResponse =
      ApiResponse<Map<String, dynamic>>.none();

  Future<void> signUp(
      {required String userName, required String password}) async {
    apiResponse = ApiResponse<Map<String, dynamic>>.loading();
    update();
    apiResponse = await SignUpRespository()
        .registerUser(userName: userName, password: password, email: '');
    if (apiResponse.status == ApiResponseStatus.success) {
      Get.off(() => const LogInPage());
    } else if (apiResponse.status == ApiResponseStatus.error) {
      Get.snackbar(
        "Registration Failed",
        apiResponse.errorMessage ?? 'Something went wrong!',
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
