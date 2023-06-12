import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/design_your_house_screen/controller/design_your_house_controller.dart';
import 'package:thikedaardotcom/screens/login_screen/controller/login_controller.dart';
import 'package:thikedaardotcom/screens/materials_screen/controller/material_controller.dart';
import 'package:thikedaardotcom/screens/sign_up_screen/controller/sign_up_controller.dart';

import '../screens/my_projects_screen/controller/my_project_controller.dart';
import '../screens/select_your_house_design/controller/select_your_house_design_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<SignUpController>(SignUpController(), permanent: true);
    Get.put<SelectYourHouseDesignController>(SelectYourHouseDesignController(),
        permanent: true);
    Get.put<MaterialController>(MaterialController(), permanent: true);
    Get.put<MyProjectController>(MyProjectController(), permanent: true);
    Get.put<DesignYourHouseController>(DesignYourHouseController(),
        permanent: true);
  }
}
