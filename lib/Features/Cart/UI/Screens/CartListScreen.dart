import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/Features/Cart/UI/Controller/CartListItem_controller.dart';
import 'package:ecommerce/Features/Cart/UI/Controller/TotalPriceController.dart';
import 'package:ecommerce/Features/Cart/UI/widgets/CartItem.dart';
import 'package:ecommerce/Features/Common/UI/Controller/Bottom_Nav_Index_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  CartListController cartListController = Get.find<CartListController>();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    cartListController.getCartList();
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
          title: Text("Cart List"),
          centerTitle: true,
          backgroundColor: AppColors.themeColors1,
        ),
        body: GetBuilder<CartListController>(
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: Visibility(
                    visible: controller.Loading == false,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: controller.productList.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          productModel:
                              controller.productList[index].productModel,
                          ItemId: controller.productList[index].id,
                        );
                      },
                    ),
                  ),
                ),
                BuildCheckoutNavBar(),
                SizedBox(height: 6,)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget BuildCheckoutNavBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.themeColors1.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(8),
      ),),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  "Total Price",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                Text(
                  cartListController.totalPrice().toString(),
                  style: TextStyle(
                    color: AppColors.themeColors1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.themeColors1,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
