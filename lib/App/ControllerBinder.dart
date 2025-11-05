import 'package:ecommerce/Features/Auth/UI/Controllers/Auth_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/OTPverify_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/SignIn_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/SignUp_controller.dart';
import 'package:ecommerce/Features/Common/Controller/Bottom_Nav_Index_Controller.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(BottomNavIndexController());
    Get.put(NetworkCaller());
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.lazyPut(()=>OTPverifyController());
  }
}