import 'package:ecommerce/Features/Common/Controller/Bottom_Nav_Index_Controller.dart';
import 'package:ecommerce/Features/Home/UI/widgets/CategoryItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<BottomNavIndexController>().setIndex(0);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Category"),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.find<BottomNavIndexController>().setIndex(0);
            },
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount:20,
            itemBuilder: (context,index){
              return FittedBox(child: CategoryItem(icon: Icons.fastfood_outlined, text: 'food',));
            },
          ),
        ),
      ),
    );
  }
}
