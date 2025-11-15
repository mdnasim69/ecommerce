import 'package:ecommerce/Features/Common/UI/Widgets/ProductCard.dart';
import 'package:ecommerce/Features/WishList/UI/Controller/WishListController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class WistList extends StatefulWidget {
  const WistList({super.key});

  @override
  State<WistList> createState() => _WistListState();
}

class _WistListState extends State<WistList> {
 late final WishListController wishListController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    wishListController = Get.find<WishListController>();
    wishListController.wishList();
    scrollController.addListener(GetMoreData);
  }

  void GetMoreData() {
    if (scrollController.position.extentAfter < 300) {
      wishListController.wishList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wish List")),
      body: GetBuilder<WishListController>(
        // init: wishListController,
        builder: (controller) {
          return Visibility(
            visible: controller.initialLoading == false,
            replacement: Center(child: CircularProgressIndicator()),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(controller: scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      print(controller.productList[index].productModel.title);
                      print(controller.productList[index].productModel.id);
                      print(controller.productList[index].productModel.photos);
                      return FittedBox(
                        child: ProductCard(
                          productModel:
                              controller.productList[index].productModel,
                        ),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: controller.Loading,
                  child: LinearProgressIndicator(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
