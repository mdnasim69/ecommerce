import 'package:ecommerce/App/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.onChange, required this.sizes});
  final List sizes;
  final Function(String) onChange;
  @override
  State<SizePicker> createState() => _SizePickerState();
}
class _SizePickerState extends State<SizePicker> {
  String? selectedSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height:8,),
        Text(
          "Size",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize:16),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.sizes.length,
            itemBuilder: (context, index) {
              String colors = widget.sizes[index];
              return GestureDetector(
                onTap: () {
                  selectedSize = colors;
                  widget.onChange(selectedSize!);
                  setState(() {});
                },
                child: Container(
                  alignment:Alignment.center,
                  margin: EdgeInsets.only(right: 8),
                  height: 30,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(8),
                    color: selectedSize==colors? AppColors.themeColors:Colors.white,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Text(
                    widget.sizes[index],
                    style: TextStyle(
                      color: selectedSize==colors? Colors.white:Colors.black,
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
