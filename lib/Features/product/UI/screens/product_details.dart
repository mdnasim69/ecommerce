import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/Auth_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/Login_Screen.dart';
import 'package:ecommerce/Features/Common/UI/Controller/AddToCart_Controller.dart';
import 'package:ecommerce/Features/product/UI/Controller/productDetails_controller.dart';
import 'package:ecommerce/Features/product/UI/Widgets/CarouselWidget.dart';
import 'package:ecommerce/Features/product/UI/Widgets/ColorsPicker.dart';
import 'package:ecommerce/Features/product/UI/Widgets/ProductCount_widget.dart';
import 'package:ecommerce/Features/product/UI/Widgets/SizePicker.dart';
import 'package:ecommerce/core/Message/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  static const String name = "/productDetails";
  final String productID;

  const ProductDetails({super.key, required this.productID});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductDetailsController productDetailsController =
      ProductDetailsController();
  AddToCartController addToCartController = AddToCartController();

  String? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    productDetailsController.GetProductDeatails(widget.productID);
  }

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
      body: GetBuilder(
        init: productDetailsController,
        builder: (controller) {
          if (controller.Loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.errorMsg != null) {
            return Center(child: Text("Product is Not found"));
          }
          return Visibility(
            visible: controller.Loading == false,
            replacement: Center(child: CircularProgressIndicator()),
            child: Column(
              children: [
                SizedBox(height: 0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductCarouselWidget(
                          photos: controller.productModel.photos.toList(),
                        ),
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
                                      controller.productModel.title,
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(fontSize: 18),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 20,
                                            ),
                                            Text(
                                              controller.productModel.rating,
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
                                              padding: const EdgeInsets.all(
                                                3.0,
                                              ),
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
                                colors: controller.productModel.colors,
                                onChange: (v) {
                                  _selectedColor = v;
                                  print(v);
                                },
                              ),
                              SizePicker(
                                onChange: (v) {
                                  _selectedSize = v;
                                  print(v);
                                },
                                sizes: controller.productModel.sizes,
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
                                controller.productModel.description,
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
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              "${controller.productModel.currentPrice} ৳",
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
                          child: GetBuilder(
                            init:addToCartController,
                            builder: (control) {
                              return Visibility(
                                visible:control.Loading==false,
                                replacement:Center(child: CircularProgressIndicator(),),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (controller.productModel.colors.isNotEmpty &&
                                        _selectedColor == null) {
                                      ShowMessage(
                                        context,
                                        "please select your color",
                                      );
                                      return;
                                    }
                                    if (controller.productModel.sizes.isNotEmpty &&
                                        _selectedSize == null) {
                                      ShowMessage(context, "please select your size");
                                      print('size missing');
                                      return;
                                    }
                                    if(Get.find<AuthController>().acessToken==null){
                                      Get.to(LoginScreen());
                                      return;
                                    }
                                    bool res = await addToCartController.AddToCart(
                                      controller.productModel.id,
                                    );
                                    if(res){
                                      ShowMessage(context, "Product Added to cart");
                                    }else{
                                      ShowMessage(context, "Fail ! try again",true);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.themeColors,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text("Add to Cart"),
                                ),
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
