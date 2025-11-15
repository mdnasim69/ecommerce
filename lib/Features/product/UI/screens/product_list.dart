import 'package:ecommerce/Features/Category/data/categoryModel.dart';
import 'package:ecommerce/Features/Common/UI/Widgets/ProductCard.dart';
import 'package:ecommerce/Features/product/UI/Controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  static const String name = "/productList";

  const ProductList({super.key, required this.category});

  final CategoryModel category;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductController productController = ProductController();

  // ProductController productController = Get.find<ProductController>();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    productController.getProducts(widget.category.id);
    scrollController.addListener(addMoreData);
  }

  void addMoreData() {
    if (scrollController.position.extentAfter < 300) {
      productController.getProducts(widget.category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.title)),
      body: GetBuilder(
        init: productController,
        builder: (controller) {
          if (controller.initialLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.ProductList.isEmpty) {
            return Center(child: Text("Empty item"));
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
                        productModel: productController.ProductList[index],
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
