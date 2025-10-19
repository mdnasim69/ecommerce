import 'package:flutter/material.dart';
import '../../../../App/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.ontap});

  final String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        fixedSize: Size.fromWidth(double.maxFinite),
        backgroundColor: AppColors.themeColors,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text,
        style: textTheme.titleSmall!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
