import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/App/assets_path.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/Auth_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/Login_Screen.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/UpdateProfilescreen.dart';
import 'package:ecommerce/Features/Category/UI/controller/category_controller.dart';
import 'package:ecommerce/Features/Home/UI/widgets/CarouselWidget.dart';
import 'package:ecommerce/Features/product/UI/Controller/NewProduct_controller.dart';
import 'package:ecommerce/Features/product/UI/Controller/SpacialProduct_controller.dart';
import 'package:ecommerce/Features/product/UI/screens/SpacialProduct_List.dart';
import 'package:ecommerce/Features/product/UI/screens/newProduct_List.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../Common/UI/Controller/Bottom_Nav_Index_Controller.dart';
import '../../../Common/UI/Widgets/ProductCard.dart';
import '../widgets/AppBarActionButton.dart';
import '../widgets/CategoryItem.dart';
import '../widgets/SectionHeader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              SearchField(),
              Column(
                children: [
                  SizedBox(height: 16),
                  CarouselWidget(),
                  SizedBox(height: 8),
                  SectionHeader(
                    onTap: () {
                      Get.find<BottomNavIndexController>().setIndex(1);
                    },
                    textHeader: "Category",
                  ),
                  SizedBox(height: 8),
                  buildCategorySection(),
                  SizedBox(height: 16),
                  SectionHeader(
                    onTap: () {
                      Navigator.pushNamed(context, NewProductListScreen.name);
                    },
                    textHeader: "New",
                  ),
                  SizedBox(height: 8),
                  buildNewSection(),
                  SizedBox(height: 16),
                  SectionHeader(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SpacialProductListScreen.name,
                      );
                    },
                    textHeader: "Spacial",
                  ),
                  SizedBox(height: 8),
                  buildSpacialSection(),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: buildUserDrawer(context),
    );
  }

  Widget buildNewSection() {
    return GetBuilder<NewProductController>(
      builder: (controller) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Visibility(
            visible: controller.initialLoading == false,
            replacement: SizedBox(
              height: 150,
              child: Center(child: CircularProgressIndicator()),
            ),
            child: Row(
              children: controller.ProductList.map((e) {
                return ProductCard(productModel: e);
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget buildSpacialSection() {
    return GetBuilder<SpacialProductController>(
      builder: (controller) {
        return Visibility(
          visible: controller.initialLoading == false,
          replacement: SizedBox(
            height: 90,
            child: Center(child: CircularProgressIndicator()),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.ProductList.map((e) {
                return ProductCard(productModel: e);
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget buildCategorySection() {
    return GetBuilder<CategoryController>(
      builder: (controller) {
        return Visibility(
          visible: controller.initialLoading == false,
          replacement: SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.categoryList.map((e) {
                return SizedBox(
                  height: 90,
                  width: 90,
                  child: CategoryItem(categoryModel: e),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.logoNavSvg, height: 30),
      toolbarHeight: 45,
      actions: [
        AppBarActionButton(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.person),
        ),
        SizedBox(width: 8),
        AppBarActionButton(onTap: () {}, icon: Icon(Icons.phone)),
        SizedBox(width: 8),
        AppBarActionButton(onTap: () {}, icon: Icon(Icons.notifications)),
        SizedBox(width: 8),
      ],
    );
  }

  Widget SearchField() {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey.shade200,
        hintText: "Search",
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Icon(Icons.search_sharp),
      ),
    );
  }

  Drawer buildUserDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Get.find<AuthController>().acessToken != null
            ? DrawerItem(context)
            : ReplacementDrawerItem(context),
      ),
    );
  }

  Column DrawerItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Drawer Header
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Colors.grey.shade300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: AppColors.themeColors1,
                child: Icon(Icons.person, size: 40, color: Colors.black),
              ),
              SizedBox(height: 12),

              Text(
                "${Get.find<AuthController>().user?.firstName ?? ""} ${Get.find<AuthController>().user?.lastName ?? ''}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                Get.find<AuthController>().user?.email ?? '',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10),

        // Phone
        ListTile(
          leading: Icon(Icons.phone),
          title: Text(Get.find<AuthController>().user?.phone ?? ""),
        ),

        // City
        ListTile(
          leading: Icon(Icons.location_city),
          title: Text(Get.find<AuthController>().user?.city ?? ''),
        ),

        Divider(),
        Expanded(child: SizedBox()),
        // Edit Profile Button

        // Close Drawer Button
        ListTile(
          leading: Icon(Icons.close),
          title: Text(
            "Close",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pop(context); // 👈 closes the drawer
          },
        ),
        ListTile(
          leading: Icon(Icons.edit, color: Colors.black),
          title: Text(
            "Edit Profile",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pushNamed(context, UpdateProfileScreen.name);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout, color: Colors.red),
          title: Text(
            "Logout",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            Get.find<AuthController>().clearData();
            Navigator.pop(context);
          },
        ),

        SizedBox(height: 32),
      ],
    );
  }

  Widget ReplacementDrawerItem(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drawer Header
              Container(
                padding: EdgeInsets.all(8),
                color: AppColors.themeColors1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.person_outline, size: 35, color: Colors.white),
                    SizedBox(height: 12),
                    Text(
                      "Welcome Guest!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Please sign in to access your profile, orders, and wishlist.",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text("About App"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text("Help & Support"),
                onTap: () {},
              ),
          
              // 🔹 Utility: Privacy Policy
              ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text("Privacy Policy"),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.login, color: Colors.green),
                title: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.name);
                },
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.close),
                title: Text("Close Drawer"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
