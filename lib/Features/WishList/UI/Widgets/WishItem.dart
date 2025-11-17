import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/Features/Common/UI/Controller/AddToCart_controller.dart';
import 'package:ecommerce/Features/Common/UI/Widgets/ProductCount_widget.dart';
import 'package:ecommerce/Features/WishList/UI/Controller/WishItemDelete_controller.dart';
import 'package:ecommerce/Features/WishList/UI/Controller/WishListController.dart';
import 'package:ecommerce/Features/product/UI/screens/product_details.dart';
import 'package:ecommerce/Features/product/data/productModel.dart';
import 'package:ecommerce/core/Message/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishItem extends StatefulWidget {
  const WishItem({
    super.key,
    required this.productModel,
    required this.WishItemId,
  });

  final ProductModel productModel;
  final String WishItemId;

  @override
  State<WishItem> createState() => _WishItemCardState();
}

class _WishItemCardState extends State<WishItem> {
  WishItemDeleteController wishItemDeleteController =
      WishItemDeleteController();
  WishListController wishListController = Get.find<WishListController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetails.name,
          arguments: widget.productModel.id,
        );
      },
      child: Card(
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.productModel.photos.isNotEmpty
                        ? widget.productModel.photos[0]
                        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4QaRqKWxfrGdQ9r5U5mWg-RWItNxzmphX-Q&s',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return const Icon(Icons.error_outline);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 180,
                              child: Text(
                                maxLines: 1,
                                widget.productModel.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Row(
                            //   children: [
                            //     FittedBox(
                            //       child: Text(
                            //         widget.productModel.colors.isNotEmpty
                            //             ? 'Color: ${widget.productModel.colors[0]}  '
                            //             : "",
                            //       ),
                            //     ),
                            //     SizedBox(width: 10),
                            //     Text(
                            //       widget.productModel.sizes.isNotEmpty
                            //           ? 'Size: ${widget.productModel.sizes[0]}'
                            //           : '',
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        GetBuilder(
                          init: wishItemDeleteController,
                          builder: (controller) {
                            return IconButton(
                              onPressed: () async {
                                await controller.deleteItem(widget.WishItemId);
                                await wishListController.reSet();
                                await wishListController.wishList();
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.productModel.currentPrice}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.themeColors1,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: FittedBox(
                            child: ProductcountWidget(onChange: (int count) {}),
                          ),
                        ),
                        Container(
                          width: 65,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () async {
                              bool res = await Get.find<AddToCartController>()
                                  .AddToCart(widget.productModel.id);
                              if (res) {
                                ShowMessage(context, "Added to your cart");
                              } else {
                                ShowMessage(
                                  context,
                                  Get.find<AddToCartController>().errorMsg
                                      .toString(),
                                  false,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(0),
                              backgroundColor: Colors.yellow,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
