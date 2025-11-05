import 'package:ecommerce/App/app_colors.dart';
import 'package:flutter/material.dart';

class ProductcountWidget extends StatefulWidget {
  const ProductcountWidget({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<ProductcountWidget> createState() => _ProductcountWidgetState();
}

class _ProductcountWidgetState extends State<ProductcountWidget> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (count <= 1) return;
            count--;
            widget.onChange(count);
            setState(() {});
          },
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: AppColors.themeColors,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(Icons.remove,color:Colors.white,size: 18,),
          ),
        ),
        SizedBox(width: 4),
        Container(
          alignment: Alignment.center,
          height: 25,
          width: 30,
          child: Text(
            "$count",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            if (count >= 20) return;
            count++;
            widget.onChange(count);
            setState(() {});
          },
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: AppColors.themeColors,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(Icons.add,color:Colors.white,size:18,),
          ),
        ),
      ],
    );
  }
}
