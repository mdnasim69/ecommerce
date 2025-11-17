import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/Features/Cart/UI/Controller/CartItemDelete_controller.dart';
import 'package:ecommerce/Features/Cart/UI/Controller/CartListItem_controller.dart';
import 'package:ecommerce/Features/Common/UI/Widgets/ProductCount_widget.dart';
import 'package:ecommerce/Features/product/UI/screens/product_details.dart';
import 'package:ecommerce/Features/product/data/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.productModel, required this.ItemId});

  final ProductModel productModel;
  final String ItemId;

  @override
  State<CartItem> createState() => _WishItemCardState();
}

class _WishItemCardState extends State<CartItem> {
  CartListController cartListController =Get.find<CartListController>();

  CartItemDeleteController cartItemDeleteController =
  CartItemDeleteController();

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
      child: Card(color:  Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 75,
                width: 70,
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
                            Container(
                              width:180,
                              child: Text(maxLines:1,
                                widget.productModel.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),overflow:TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                FittedBox(
                                  child: Text(
                                    widget.productModel.colors.isNotEmpty
                                        ? 'Color: ${widget.productModel
                                        .colors[0]}  '
                                        : "",
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  widget.productModel.sizes.isNotEmpty
                                      ? 'Size: ${widget.productModel.sizes[0]}'
                                      : '',
                                ),
                              ],
                            ),
                          ],
                        ),
                        GetBuilder(
                            init:cartItemDeleteController,
                            builder: (controller) {
                              return IconButton(
                                onPressed: () {
                                  controller.deleteItem(widget.ItemId);
                                  cartListController.getCartList();
                                },
                                icon: const Icon(
                                    Icons.delete, color: Colors.black),
                              );
                            }
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
                          width: 80,
                          child: FittedBox(
                            child: ProductcountWidget(onChange: (int count) {
                              print(count);
                              cartListController.UpdateItem(widget.ItemId, count);
                            }),
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
