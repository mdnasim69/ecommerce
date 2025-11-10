import 'package:ecommerce/Features/Common/UI/Widgets/ProductCard.dart';
import 'package:ecommerce/Features/product/UI/Controller/NewProduct_controller.dart';
import 'package:ecommerce/Features/product/UI/Controller/SpacialProduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpacialProductListScreen extends StatefulWidget {
  static const String name = "/SpacialProductList";

  const SpacialProductListScreen({super.key,});

  @override
  State<SpacialProductListScreen> createState() => _SpacialProductListScreenState();
}

class _SpacialProductListScreenState extends State<SpacialProductListScreen> {
  ScrollController scrollController = ScrollController();
  SpacialProductController spacialProductController =Get.find<SpacialProductController>();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(addMoreData);
  }

  void addMoreData() {
    if (scrollController.position.extentAfter < 300) {
      spacialProductController.getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New")),
      body: GetBuilder<SpacialProductController>(
        builder: (controller) {
          if (controller.initialLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: controller.ProductList.length,
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: ProductCard(
                        productModel: spacialProductController.ProductList[index],
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
          );
        },
      ),
    );
  }
}
