import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../App/app_colors.dart';

class ProductCarouselWidget extends StatefulWidget {
  const ProductCarouselWidget({super.key});

  @override
  State<ProductCarouselWidget> createState() => _ProductCarouselWidgetState();
}

class _ProductCarouselWidgetState extends State<ProductCarouselWidget> {
  int _slideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1,
            onPageChanged: (sellectedIndex, reason) {
              _slideIndex = sellectedIndex;
              setState(() {});
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.grey,
                  ),
                  child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right:0,
          bottom:16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  margin: EdgeInsets.all(2),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: _slideIndex != i
                        ? AppColors.themeColors.withOpacity(.7)
                        : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: AppColors.themeColors),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
