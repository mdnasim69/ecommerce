import 'package:ecommerce/Features/Common/UI/Widgets/ProductCard.dart';
import 'package:ecommerce/Features/product/UI/Controller/NewProduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductListScreen extends StatefulWidget {
  static const String name = "/NewProductList";

  const NewProductListScreen({super.key,});

  @override
  State<NewProductListScreen> createState() => _NewProductListScreenState();
}

class _NewProductListScreenState extends State<NewProductListScreen> {
  ScrollController scrollController = ScrollController();
  NewProductController newProductController =Get.find<NewProductController>();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(addMoreData);
  }

  void addMoreData() {
    if (scrollController.position.extentAfter < 300) {
      newProductController.getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New")),
      body: GetBuilder<NewProductController>(
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
                        productModel: newProductController.ProductList[index],
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
