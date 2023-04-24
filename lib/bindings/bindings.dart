import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/login_screen/controller/login_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<LoginController>(LoginController(), permanent: true);
  }
}
