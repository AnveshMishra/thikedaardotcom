import 'package:thikedaardotcom/screens/materials_screen/model/category_response_model.dart';

import '../../../network/api_client.dart';
import '../../../network/api_end_points.dart';
import '../../../network/api_response.dart';

class MaterialRepo {
  static final MaterialRepo _singleton = MaterialRepo._internal();
  factory MaterialRepo() {
    return _singleton;
  }
  MaterialRepo._internal();

  final ApiClient _client = ApiClient();

  Future<ApiResponse<CategoryResponseModel>> fetchCategory() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await _client.get(
        getCategory,
      );
      ApiResponse<CategoryResponseModel> apiResponse =
          ApiResponse.success(CategoryResponseModel.fromJson(response.data));
      return apiResponse;
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
