import 'package:ecommerce/Features/Common/UI/Widgets/ProductCard.dart';
import 'package:flutter/material.dart';

class WistList extends StatefulWidget {
  const WistList({super.key});

  @override
  State<WistList> createState() => _WistListState();
}

class _WistListState extends State<WistList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wish List")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return FittedBox(child: ProductCard());
        },
      ),
    );
  }
}
