import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/Features/Category/UI/controller/category_controller.dart';
import 'package:ecommerce/Features/Category/UI/screens/Categori_screen.dart';
import 'package:ecommerce/Features/Common/UI/Controller/Slide_controller.dart';
import 'package:ecommerce/Features/Home/UI/screens/home_screen.dart';
import 'package:ecommerce/Features/product/UI/Controller/NewProduct_controller.dart';
import 'package:ecommerce/Features/product/UI/Controller/SpacialProduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../WishList/UI/screens/wishList.dart';
import '../Controller/Bottom_Nav_Index_Controller.dart';

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
  void initState() {
    super.initState();
    Get.find<SpacialProductController>().getProducts();
    Get.find<NewProductController>().getProducts();
    Get.find<CategoryController>().getCategory();
    Get.find<SlideController>().getSlider();
  }
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
