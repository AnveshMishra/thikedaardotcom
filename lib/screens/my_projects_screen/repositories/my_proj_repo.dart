import 'package:thikedaardotcom/network/api_end_points.dart';
import 'package:thikedaardotcom/screens/my_projects_screen/models/banner_images_response_model.dart';

import '../../../network/api_client.dart';
import '../../../network/api_response.dart';

class MyProjRepo {
  static final MyProjRepo _singleton = MyProjRepo._internal();
  factory MyProjRepo() {
    return _singleton;
  }
  MyProjRepo._internal();

  final ApiClient _client = ApiClient();

  Future<ApiResponse<BannerImagesResponseModel>> getBannerImages() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await _client.get(bannerImages);
      ApiResponse<BannerImagesResponseModel> apiResponse = ApiResponse.success(
          BannerImagesResponseModel.fromJson(response.data));
      return apiResponse;
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
