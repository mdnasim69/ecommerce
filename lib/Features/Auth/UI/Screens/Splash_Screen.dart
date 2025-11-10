import 'package:ecommerce/App/app_configure.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/Auth_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/Login_Screen.dart';
import 'package:ecommerce/Features/Common/UI/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/Logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 // AuthController authController =Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    GoToScreen();

  }

  Future<void> GoToScreen() async {
    await Future.delayed(Duration(seconds: 2));
    await Get.find<AuthController>().getData();
    Navigator.pushReplacementNamed(context, MainBottomNavScreen.name,);

  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            SvgLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              "${AppLocalizations.of(context)!.version}: ${AppConfiguration.appVersion}",
              style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
