import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/Features/WishList/UI/Controller/WishListController.dart';
import 'package:ecommerce/Features/WishList/UI/Widgets/WishItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/UI/Controller/Bottom_Nav_Index_Controller.dart';

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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<BottomNavIndexController>().setIndex(0);
      },
      child: Scaffold(backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: AppColors.themeColors,
          centerTitle: true,
          title: Text("Wish List"),
        ),
        body: GetBuilder<WishListController>(
          builder: (controller) {
            if (controller.initialLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (controller.productList.isEmpty) {
              return Center(child: Text("Empty Item"));
            }
            return Column(
              children: [
                Expanded(
                  child: Visibility(
                    visible: controller.initialLoading == false,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: controller.productList.length,
                      itemBuilder: (context, index) {
                        print(controller.productList[index].id);
                        return WishItem(
                          productModel:
                              controller.productList[index].productModel,
                          WishItemId: controller.productList[index].id,
                        );
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.Loading,
                  child: LinearProgressIndicator(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
