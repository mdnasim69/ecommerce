import 'package:ecommerce/Features/Auth/UI/Controllers/Auth_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/Login_Screen.dart';
import 'package:ecommerce/core/Message/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavIndexController extends GetxController {
  int _index = 0;

  int get index => _index;

  setIndex(int index) {
    if (index == 2 || index == 3) {
      if (Get.find<AuthController>().acessToken == null) {
        Get.to(LoginScreen());
      }
    }

    _index = index;
    update();
  }
}
