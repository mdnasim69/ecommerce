import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/App/assets_path.dart';
import 'package:ecommerce/Features/Common/Controller/Bottom_Nav_Index_Controller.dart';
import 'package:ecommerce/Features/Home/UI/widgets/CarouselWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
    final textstyle =Theme.of(context).textTheme;
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            SearchField(),
            SizedBox(height: 16),
            CarouselWidget(),
            SizedBox(height: 8),
            SectionHeader(onTap: () {
              Get.find<BottomNavIndexController>().setIndex(1);
            }, textHeader: "Category"),
            SizedBox(height: 8),
            buildCategorySection(),
            SizedBox(height: 16),
            SectionHeader(onTap: () {}, textHeader: "Popular"),
            SizedBox(height: 8),
            buildPopularSection(),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView buildPopularSection() {
    return SingleChildScrollView(
            scrollDirection:Axis.horizontal,
            child: Row(
              children: [
                ProductCard(),
                ProductCard(),ProductCard(),ProductCard(),ProductCard(),ProductCard(),ProductCard(),

              ],
            ),
          );
  }

  Widget buildCategorySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryItem(text: "Electronic", icon: Icons.lightbulb_outline),
          CategoryItem(text: "Food", icon: Icons.fastfood_outlined),
          CategoryItem(text: "Computer", icon: Icons.computer_outlined),
          CategoryItem(text: "Gift", icon: Icons.style_outlined),
          CategoryItem(text: "Electronic", icon: Icons.lightbulb_outline),
          CategoryItem(text: "Electronic", icon: Icons.lightbulb_outline),
          CategoryItem(text: "Electronic", icon: Icons.lightbulb_outline),
        ],
      ),
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
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Icon(Icons.search_sharp),
      ),
    );
  }
}


