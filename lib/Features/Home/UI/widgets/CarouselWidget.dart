import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Features/Common/UI/Controller/Slide_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return GetBuilder<SlideController>(
      builder: (controller) {
        return Visibility(
          visible: controller.Loading == false,
          replacement: SizedBox(
            height: 180,
            child: Center(child: CircularProgressIndicator()),
          ),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay:true,
                  height: 140.0,
                  viewportFraction: .90,
                  onPageChanged: (sellectedIndex, reason) {
                    _slideIndex = sellectedIndex;
                    setState(() {});
                  },
                ),
                items: controller.sliders.map((slide) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.transparent,
                          image: DecorationImage(image: NetworkImage(slide.photoUrl),fit:BoxFit.fill)
                        ),
                        child: Text(
                          ' ',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < controller.sliders.length; i++)
                    Container(
                      margin: EdgeInsets.all(2),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: _slideIndex == i
                            ? AppColors.themeColors.withOpacity(.7)
                            : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: AppColors.themeColors,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
