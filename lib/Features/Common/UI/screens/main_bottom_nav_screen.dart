import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/Features/Cart/UI/Screens/CartListScreen.dart';
import 'package:ecommerce/Features/Category/UI/controller/category_controller.dart';
import 'package:ecommerce/Features/Category/UI/screens/Categori_screen.dart';
import 'package:ecommerce/Features/Common/UI/Controller/Slide_controller.dart';
import 'package:ecommerce/Features/Home/UI/screens/home_screen.dart';
import 'package:ecommerce/Features/product/UI/Controller/NewProduct_controller.dart';
import 'package:ecommerce/Features/product/UI/Controller/SpacialProduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    CartList(),
    WistList(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<SpacialProductController>().getProducts();
      Get.find<NewProductController>().getProducts();
      Get.find<CategoryController>().getCategory();
      Get.find<SlideController>().getSlider();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        exitDialog();
      },
      child: Scaffold(
        body: GetBuilder<BottomNavIndexController>(
          builder: (controller) {
            return screens[controller.index];
          },
        ),
        bottomNavigationBar: GetBuilder<BottomNavIndexController>(
          builder: (controller) {
            return NavigationBar(height:60,
              backgroundColor: Colors.grey.shade100,
              elevation: 0,
              indicatorColor: AppColors.themeColors1,
              onDestinationSelected: controller.setIndex,
              selectedIndex: controller.index,
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(
                  icon: Icon(Icons.category_outlined),
                  label: "category",
                ),
                NavigationDestination(
                  icon: Icon(Icons.shopping_cart),
                  label: "Cart",
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite),
                  label: "wish List",
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  exitDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Exit App"),
          content: Text("Do you want to exit"),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
