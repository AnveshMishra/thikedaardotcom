import 'package:get/get.dart';

import '../../../network/api_response.dart';
import '../models/banner_images_response_model.dart';
import '../repositories/my_proj_repo.dart';

class MyProjectController extends GetxController {
  MyProjectController() {
    getImages();
  }
  ApiResponse<BannerImagesResponseModel> apiResponse =
      ApiResponse<BannerImagesResponseModel>.none();

  Future<void> getImages() async {
    apiResponse = ApiResponse.loading();
    update();
    apiResponse = await MyProjRepo().getBannerImages();
    update();
  }
}
