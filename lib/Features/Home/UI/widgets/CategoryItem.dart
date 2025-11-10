import 'package:ecommerce/Features/Category/data/categoryModel.dart';
import 'package:ecommerce/Features/product/UI/screens/product_list.dart';
import 'package:flutter/material.dart';
import '../../../../App/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryModel});

final CategoryModel categoryModel ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductList.name, arguments:categoryModel,);
      },
      child: Container(height:100,width: 100,
        child: Column(
          children: [
            Expanded(
              child: Card(
                color: AppColors.themeColors.withOpacity(.2),
                elevation: 0,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(
                    categoryModel.icon.toString(),
                    height: 56,
                    width: 56,
                   // color:AppColors.themeColors,
                    fit:BoxFit.fill,
                  ),
                ),
              ),
            ),
            FittedBox(
              child: Text(
                categoryModel.title,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.themeColors,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
