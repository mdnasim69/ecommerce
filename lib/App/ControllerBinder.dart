import 'package:ecommerce/Features/Auth/UI/Controllers/Auth_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/OTPverify_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/SignIn_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/SignUp_controller.dart';
import 'package:ecommerce/Features/Category/UI/controller/category_controller.dart';
import 'package:ecommerce/Features/Common/UI/Controller/Slide_controller.dart';
import 'package:ecommerce/Features/product/UI/Controller/NewProduct_controller.dart';
import 'package:ecommerce/Features/product/UI/Controller/SpacialProduct_controller.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';
import '../Features/Common/UI/Controller/Bottom_Nav_Index_Controller.dart';
import '../Features/WishList/UI/Controller/WishListController.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(BottomNavIndexController());
    Get.put(NetworkCaller());
    Get.put(CategoryController());
    Get.put(SlideController());
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(NewProductController());
    Get.put(SpacialProductController());
    Get.lazyPut(()=>OTPverifyController());
    Get.put(WishListController());
  }
}