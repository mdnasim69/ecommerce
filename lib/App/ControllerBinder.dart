import 'package:ecommerce/Features/Common/Controller/Bottom_Nav_Index_Controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavIndexController());
  }
}