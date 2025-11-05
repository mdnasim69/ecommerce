import 'package:ecommerce/App/ControllerBinder.dart';
import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/App/app_fonts.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import '../l10n/app_localizations.dart';
import 'app_routes.dart';

class Ecommerce extends StatefulWidget {
  const Ecommerce({super.key});

  @override
  State<Ecommerce> createState() => _EcommerceState();
}

class _EcommerceState extends State<Ecommerce> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.name,
      initialBinding:ControllerBinder(),
      onGenerateRoute: AppRoutes.OnGenerateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor:Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          fillColor:Colors.transparent,
          filled:true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.themeColors, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.themeColors, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.themeColors, width: 1.5),
          ),
        ),
        colorSchemeSeed: AppColors.themeColors,
        textTheme: AppFonts.fontsTheme(),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('en'),
      supportedLocales: [
        Locale('en'), // English
        Locale('bn'), // Spanish
      ],
    );
  }
}
