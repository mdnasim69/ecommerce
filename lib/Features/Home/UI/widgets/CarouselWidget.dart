import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../App/app_colors.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _slideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 140.0,
            viewportFraction: .90,
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
                    color: AppColors.themeColors,
                  ),
                  child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++)
              Container(
                margin: EdgeInsets.all(2),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _slideIndex == i
                      ? AppColors.themeColors.withOpacity(.7)
                      : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: AppColors.themeColors),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
