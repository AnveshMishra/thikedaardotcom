import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:thikedaardotcom/network/api_client.dart';
import 'package:thikedaardotcom/network/api_response.dart';
import 'package:thikedaardotcom/screens/login_screen/model/login_response_model.dart';
import 'package:thikedaardotcom/screens/nav_sceen.dart/constants/constants.dart';

import '../../../network/api_end_points.dart';

class LoginRespository {
  static final LoginRespository _singleton = LoginRespository._internal();
  factory LoginRespository() {
    return _singleton;
  }
  LoginRespository._internal();

  final ApiClient _client = ApiClient();

  Future<ApiResponse<LoginResponseModel>> login(
      {required String userName, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await _client.post(
        signIn,
        data: {"username": userName, "password": password},
      );
      ApiResponse<LoginResponseModel> apiResponse =
          ApiResponse.success(LoginResponseModel.fromJson(response.data));
      if (response.statusCode == 200) {
        final Map<String, dynamic> resultData = response.data;

        if (resultData.isNotEmpty) {
          // store user info
          gUserInfo = {
            "id": resultData["id"],
            "username": resultData["username"],
            "email": resultData["email"],
            "role": resultData["roles"],
            "token": resultData["token"],
          };
          // store user info local storage
          GetStorage().write("userInfo", resultData.toString());
        }
      }
      return apiResponse;
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  // test user
  // test6@architect
}
