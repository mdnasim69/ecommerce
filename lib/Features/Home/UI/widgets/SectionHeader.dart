import 'package:flutter/material.dart';
import '../../../../App/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.onTap,
    required this.textHeader,
  });

  final VoidCallback onTap;
  final String textHeader;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textHeader,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "See All",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.themeColors,
            ),
          ),
        ),
      ],
    );
  }
}
