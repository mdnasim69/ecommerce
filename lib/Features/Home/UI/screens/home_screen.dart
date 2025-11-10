import 'package:ecommerce/App/assets_path.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: 90,
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
            height: 90,
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
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.logoNavSvg, height: 30),
      toolbarHeight: 45,
      actions: [
        AppBarActionButton(onTap: () {}, icon: Icon(Icons.person)),
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
        hintStyle: Theme
            .of(context)
            .textTheme
            .titleMedium!
            .copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Icon(Icons.search_sharp),
      ),
    );
  }
}
