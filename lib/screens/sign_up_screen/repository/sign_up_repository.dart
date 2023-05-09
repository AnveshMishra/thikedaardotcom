import 'package:thikedaardotcom/network/api_client.dart';
import 'package:thikedaardotcom/network/api_response.dart';

import '../../../network/api_end_points.dart';

class SignUpRespository {
  static final SignUpRespository _singleton = SignUpRespository._internal();
  factory SignUpRespository() {
    return _singleton;
  }
  SignUpRespository._internal();

  final ApiClient _client = ApiClient();

  Future<ApiResponse<Map<String, dynamic>>> registerUser(
      {required String userName,
      required String password,
      required String email}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await _client.post(
        signUp,
        data: {
          "username": userName,
          "password": password,
          "email": email,
          "roles": ["architect"]
        },
      );
      if (response.statusCode == 200) {
        ApiResponse<Map<String, dynamic>> apiResponse =
            ApiResponse.success(response.data);
        return apiResponse;
      } else if (response.statusCode == 400) {
        return ApiResponse.error(response.data['message']);
      } else {
        return ApiResponse.error("Something went wrong!");
      }
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
