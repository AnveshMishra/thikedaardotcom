import 'package:get/get.dart';
import 'package:thikedaardotcom/network/api_client.dart';

class MaterialController extends GetxController {}

class MaterialService {
  static final ApiClient _apiClient = ApiClient();
  static String baseUrl = "";
  static fetchCategoriesList() async {
    String url = "api/admin/category/list";
    final result = await _apiClient.get("$baseUrl$url");
    if (result.statusCode == 200) {
      final resultData = result.data;
      // dynamic categoryList = resultData["list"];
    }
  }

  static fetchProductList() async {}
}


// {r
// 					"name": "Category API for listing",
// 					"request": {
// 						"method": "GET",
// 						"header": [],
// 						"url": {
// 							"raw": "{{local}}api/admin/category/list",
// 							"host": [
// 								"{{local}}api"
// 							],
// 							"path": [
// 								"admin",
// 								"category",
// 								"list"
// 							]
// 						}
// 					},
// 					"response": []
// 				}