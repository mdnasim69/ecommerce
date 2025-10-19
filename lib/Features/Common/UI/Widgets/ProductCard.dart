import 'package:flutter/material.dart';

import '../../../../App/app_colors.dart';
import '../../../../App/assets_path.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    final textstyle =Theme.of(context).textTheme;
    return Padding(
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
                  image: DecorationImage(
                    image: AssetImage(AssetsPath.laptopPNG),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Text(
                      "mac book M2 air laptop",
                      maxLines: 1,
                      style: textstyle.bodySmall!.copyWith(overflow: TextOverflow.ellipsis),
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("44k৳",style:textstyle.bodySmall!.copyWith(color:AppColors.themeColors),),
                        Wrap(crossAxisAlignment:WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.star,size:14,color:Colors.yellow,),
                            Text("4.0",style:textstyle.bodySmall!.copyWith(color:Colors.black),),
                            Card(
                              color:AppColors.themeColors,
                              child:Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.favorite,size:12,color:Colors.white,),
                              ),
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}