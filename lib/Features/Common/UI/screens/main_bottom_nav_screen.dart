import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/Features/Category/UI/screens/Categori_screen.dart';
import 'package:ecommerce/Features/Common/Controller/Bottom_Nav_Index_Controller.dart';
import 'package:ecommerce/Features/Home/UI/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../WishList/UI/screens/wishList.dart';

class MainBottomNavScreen extends StatefulWidget {
  static const String name = '/main-bottom-nav';

  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    HomeScreen(),
    WistList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavIndexController>(
        builder: (controller) {
          return screens[controller.index];
        }
      ),
      bottomNavigationBar: GetBuilder<BottomNavIndexController>(
        builder: (controller) {
          return NavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            indicatorColor: AppColors.themeColors,
            onDestinationSelected: controller.setIndex,
            selectedIndex: controller.index,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(
                icon: Icon(Icons.category_outlined),
                label: "category",
              ),
              NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Cart"),
              NavigationDestination(icon: Icon(Icons.favorite), label: "wish List"),
            ],
          );
        }
      ),
    );
  }
}
