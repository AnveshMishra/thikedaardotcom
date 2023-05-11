import 'package:thikedaardotcom/network/api_client.dart';
import 'package:thikedaardotcom/network/api_response.dart';

import '../../../network/api_end_points.dart';
import '../model/get_design_data_request_model.dart';

class SelectYourHouseDesignRespository {
  static final SelectYourHouseDesignRespository _singleton =
      SelectYourHouseDesignRespository._internal();
  factory SelectYourHouseDesignRespository() {
    return _singleton;
  }
  SelectYourHouseDesignRespository._internal();

  final ApiClient _client = ApiClient();

  Future<ApiResponse<GetDesignDataResponseModel>> getDesignData() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await _client.get(getDesign);
      ApiResponse<GetDesignDataResponseModel> apiResponse = ApiResponse.success(
          GetDesignDataResponseModel.fromJson(response.data));
      return apiResponse;
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
