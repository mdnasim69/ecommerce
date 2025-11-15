import 'package:ecommerce/Features/product/UI/screens/product_details.dart';
import 'package:ecommerce/Features/product/data/productModel.dart';
import 'package:flutter/material.dart';

import '../../../../App/app_colors.dart';
import '../../../../App/assets_path.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.productModel,
  });

 final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final textstyle =Theme.of(context).textTheme;
    return GestureDetector(
      onTap:(){
        Navigator.pushNamed(context, ProductDetails.name,arguments:productModel.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(right:8),
        child: Container(
          width: 120,
          child: Card(
            color:Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
            ),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 140,
                  decoration: BoxDecoration(
                    color:
                    AppColors.themeColors.withOpacity(0.2),
                      image:productModel.photos.isNotEmpty? DecorationImage(
                      image: NetworkImage(productModel.photos[0]),
                      fit: BoxFit.fill,
                    ):null,
                  ),
                  child:productModel.photos.isEmpty?Icon(Icons.error_outline):null,
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Text(
                       productModel.title,
                        maxLines: 1,
                        style: textstyle.bodySmall!.copyWith(overflow: TextOverflow.ellipsis),
                      ),
                      FittedBox(
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${productModel.currentPrice}৳",style:textstyle.bodySmall!.copyWith(color:AppColors.themeColors),),
                            Wrap(crossAxisAlignment:WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.star,size:14,color:Colors.yellow,),
                                Text(productModel.rating,style:textstyle.bodySmall!.copyWith(color:Colors.black),),
                                Card(
                                  color:AppColors.themeColors,
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                                  child:Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(Icons.favorite,size:12,color:Colors.white,),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}