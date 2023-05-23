import 'package:thikedaardotcom/screens/design_your_house_screen/model/design_your_house_response_model.dart';

import '../../../network/api_client.dart';
import '../../../network/api_end_points.dart';
import '../../../network/api_response.dart';

class DesignYouHouseRepo {
  static final DesignYouHouseRepo _singleton = DesignYouHouseRepo._internal();
  factory DesignYouHouseRepo() {
    return _singleton;
  }
  DesignYouHouseRepo._internal();

  final ApiClient _client = ApiClient();

  Future<ApiResponse<DesignYourHouseResponseModel>> postDesignDetails(
      Map data) async {
    try {
      final response = await _client.post(genrateDesign, data: data);
      ApiResponse<DesignYourHouseResponseModel> apiResponse =
          ApiResponse.success(
              DesignYourHouseResponseModel.fromJson(response.data));
      return apiResponse;
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
