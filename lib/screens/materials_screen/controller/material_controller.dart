import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/materials_screen/model/category_response_model.dart';
import 'package:thikedaardotcom/screens/materials_screen/model/product_response_model.dart';
import 'package:thikedaardotcom/screens/materials_screen/repository/material_repo.dart';

import '../../../network/api_response.dart';

class MaterialController extends GetxController {
  MaterialController() {
    getCategoryResponse();
    fetchAllProduct();
  }
  ApiResponse<CategoryResponseModel> apiResponse =
      ApiResponse<CategoryResponseModel>.none();
  ApiResponse<ProductResponseModel> productApiResponse =
      ApiResponse<ProductResponseModel>.none();

  Future<void> getCategoryResponse() async {
    apiResponse = ApiResponse<CategoryResponseModel>.loading();
    print('--------->>>>>>$apiResponse.data');
    update();
    apiResponse = await MaterialRepo().fetchCategory();
    print('--------->>>>>>$apiResponse.data');
    update();
  }

  Future<void> fetchAllProduct() async {
    productApiResponse = ApiResponse<ProductResponseModel>.loading();
    update();
    productApiResponse = await MaterialRepo().fetchAllProduct();
    update();
  }
}
