import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../App/assets_path.dart';

class SvgLogo extends StatelessWidget {
  const SvgLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPath.logoSvg,width:100,);
  }
}
