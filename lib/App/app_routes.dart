import 'package:ecommerce/Features/Auth/UI/Screens/Login_Screen.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/OtpCode_Screen.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/SignUp_Screen.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/Splash_Screen.dart';
import 'package:ecommerce/Features/product/UI/screens/product_details.dart';
import 'package:ecommerce/Features/product/UI/screens/product_list.dart';
import 'package:flutter/material.dart';

import '../Features/Common/UI/screens/main_bottom_nav_screen.dart';

class AppRoutes {
  static Route<dynamic> OnGenerateRoute(RouteSettings setting) {
    late Widget widget;
    if (setting.name == SplashScreen.name) {
      widget = SplashScreen();
    } else if (setting.name == LoginScreen.name) {
      widget = LoginScreen();
    } else if (setting.name == SignUpScreen.name) {
      widget = SignUpScreen();
    } else if (setting.name == OtpCodeScreen.name) {
      final String email =setting.arguments as String;
      widget = OtpCodeScreen(email:email,);
    } else if (setting.name == MainBottomNavScreen.name) {
      widget = MainBottomNavScreen();
    } else if (setting.name == ProductList.name) {
      final String category = setting.arguments as String;
      widget = ProductList(category: category);
    }else if (setting.name == ProductDetails.name) {
      widget = ProductDetails();
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
