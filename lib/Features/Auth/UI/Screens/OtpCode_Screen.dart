import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/Features/Auth/UI/Widgets/Logo.dart';
import 'package:ecommerce/core/extension/localization_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../l10n/app_localizations.dart';
import '../Widgets/AuthButton.dart';

class OtpCodeScreen extends StatefulWidget {
  static const String name = "otpCode";

  const OtpCodeScreen({super.key});

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  bool obscure = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _OtpCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200),
                SvgLogo(),
                SizedBox(height: 32),
                Text(
                  context.local.a4DigitCodeHasBeenSentToYourEmailAddress,
                  textAlign:TextAlign.center,
                  style: textTheme.titleMedium!.copyWith(

                      color: Colors.orange),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      borderWidth: 3,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(20),
                      fieldHeight: 45,
                      fieldWidth: 50,
                      selectedBorderWidth: 4,
                      inactiveBorderWidth:3,
                      activeBorderWidth:3,
                      errorBorderColor: Colors.red,
                      selectedColor: AppColors.themeColors,
                      inactiveColor: AppColors.themeColors,
                      activeColor: AppColors.themeColors,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: false,
                    controller: _OtpCodeController,
                    appContext: context,
                  ),
                ),
                SizedBox(height: 16),
                AuthButton(
                  text: AppLocalizations.of(context)!.done,
                  ontap: () {},
                ),
                SizedBox(height: 48),
                Column(mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    Text(
                      context.local.theCodeWillExpairIn120Second,
                      style: textTheme.titleMedium!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height:8,),
                    Text(
                      context.local.resendCode,
                      style: textTheme.titleMedium!.copyWith(
                        color: AppColors.themeColors,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _OtpCodeController.dispose();
  }
}
