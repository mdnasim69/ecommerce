import 'package:ecommerce/Features/product/UI/screens/product_list.dart';
import 'package:flutter/material.dart';

import '../../../../App/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.pushNamed(context, ProductList.name, arguments:text);
      },
      child: Column(
        children: [
          Card(
            color: AppColors.themeColors.withOpacity(.2),
            elevation: 0,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(icon, size: 32, color: AppColors.themeColors),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.themeColors,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
