import 'package:ecommerce/Features/Category/UI/controller/category_controller.dart';
import 'package:ecommerce/Features/Home/UI/widgets/CategoryItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Common/UI/Controller/Bottom_Nav_Index_Controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryController categoryController =Get.find<CategoryController>();
  ScrollController scrollController = ScrollController();
  @override

  void initState() {
    super.initState();
    scrollController.addListener(getMoreData);
  }

  void getMoreData(){
    if(scrollController.position.extentAfter<300){
      categoryController.getCategory();
    }
  }
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
          child: GetBuilder<CategoryController>(
            builder: (controller) {
              if(controller.initialLoading){
                return Center(child:CircularProgressIndicator(),);
              }
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(controller:scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: controller.categoryList.length,
                      itemBuilder: (context, index){
                        return FittedBox(
                          child: CategoryItem(
                            categoryModel:controller.categoryList[index],
                          ),
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible:categoryController.Loading==true,
                      child: LinearProgressIndicator())
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
