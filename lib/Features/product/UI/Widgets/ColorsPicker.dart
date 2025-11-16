import 'package:ecommerce/App/app_colors.dart';
import 'package:flutter/material.dart';

class ColorsPicker extends StatefulWidget {
  const ColorsPicker({super.key, required this.colors, required this.onChange});

  final List colors;
  final Function(String) onChange;

  @override
  State<ColorsPicker> createState() => _ColorsPickerState();
}

class _ColorsPickerState extends State<ColorsPicker> {

  String? selectedColors;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height:8,),
        Text(
          "Colors",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize:16),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.colors.length,
            itemBuilder: (context, index) {
              String colors = widget.colors[index];
              return GestureDetector(
                onTap: () {
                  selectedColors = colors;
                  widget.onChange(selectedColors!);
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.only(right: 8),
                  height: 40,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(8),
                    color: selectedColors==colors? AppColors.themeColors1:Colors.white,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Text(
                    widget.colors[index],
                    style: TextStyle(
                      color: selectedColors==colors? Colors.white:Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
