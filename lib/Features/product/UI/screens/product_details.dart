import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/Features/product/UI/Widgets/CarouselWidget.dart';
import 'package:ecommerce/Features/product/UI/Widgets/ColorsPicker.dart';
import 'package:ecommerce/Features/product/UI/Widgets/ProductCount_widget.dart';
import 'package:ecommerce/Features/product/UI/Widgets/SizePicker.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  static const String name = "productDetails";

  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("Product Details"),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductCarouselWidget(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Happy New Year Spacial deal Save 30%",
                                textAlign: TextAlign.left,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(fontSize: 18),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 20,
                                      ),
                                      Text(
                                        " 3.8",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 16),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Reviews",
                                      style: TextStyle(
                                        color: AppColors.themeColors,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      color: AppColors.themeColors,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 24),
                        ProductcountWidget(onChange: (v) {}),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ColorsPicker(
                          colors: ["rad", "blue", "yellow", "green", "black"],
                          onChange: (v) {},
                        ),
                        SizePicker(
                          onChange: (v) {
                            print(v);
                          },
                          sizes: ['S', 'M', 'L', 'XL'],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '''Classic Cotton T-Shirt – Comfortable & Stylish Experience everyday comfort with our Classic Cotton T-Shirt, designed to keep you cool and stylish no matter the occasion. Made from 100% breathable cotton, this tee features a modern fit and durable stitching to last wash after wash. Premium Quality Fabric: Soft, lightweight cotton for ultimate comfort Perfect Fit: Tailored design that complements all body types Versatile Style: Ideal for casual outings, workouts, or layering Available Sizes: S, M, L, XL, XXL Easy Care: Machine washable and wrinkle-resistant Upgrade your wardrobe with a timeless staple that pairs perfectly with jeans, shorts, or jackets. Whether you're heading to a casual meet-up or lounging at home, this t-shirt has got you covered.''',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 95,
            decoration: BoxDecoration(
              color: AppColors.themeColors.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
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
                        "Price",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      Text(
                        "44000 ৳",
                        style: TextStyle(
                          color: AppColors.themeColors,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themeColors,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("Add to Cart"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
