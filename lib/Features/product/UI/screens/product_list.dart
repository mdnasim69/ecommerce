import 'package:ecommerce/Features/Common/UI/Widgets/ProductCard.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  static const String name = "productList";

  const ProductList({super.key, required this.category});

  final String category;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount:20,
        itemBuilder: (context,index){
          return FittedBox(child: ProductCard());
        },
      ),
    );
  }
}
