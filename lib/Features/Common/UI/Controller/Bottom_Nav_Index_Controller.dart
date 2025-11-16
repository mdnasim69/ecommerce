import 'package:ecommerce/Features/Auth/UI/Controllers/Auth_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/Login_Screen.dart';
import 'package:get/get.dart';

class BottomNavIndexController extends GetxController {
  int _index = 0;

  int get index => _index;

  setIndex(int index) {
    if (index == 2 || index == 3) {
      if (Get.find<AuthController>().acessToken == null) {
        Get.to(LoginScreen());
        return;
      }

    }

    _index = index;
    update();
  }
}
