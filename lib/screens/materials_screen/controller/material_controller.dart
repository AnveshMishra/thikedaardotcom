import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/materials_screen/model/category_response_model.dart';
import 'package:thikedaardotcom/screens/materials_screen/repository/material_repo.dart';

import '../../../network/api_response.dart';

class MaterialController extends GetxController {
  MaterialController() {
    getCategoryResponse();
  }
  ApiResponse<CategoryResponseModel> apiResponse =
      ApiResponse<CategoryResponseModel>.none();

  Future<void> getCategoryResponse() async {
    apiResponse = ApiResponse<CategoryResponseModel>.loading();
    update();
    apiResponse = await MaterialRepo().fetchCategory();
    update();
  }
}
