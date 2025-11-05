import 'dart:async';

import 'package:ecommerce/App/app_colors.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/OTPverify_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/Login_Screen.dart';
import 'package:ecommerce/Features/Auth/UI/Widgets/Logo.dart';
import 'package:ecommerce/Features/Auth/data/Models/VerifyOtpReqModel.dart';
import 'package:ecommerce/core/Message/message.dart';
import 'package:ecommerce/core/extension/localization_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../l10n/app_localizations.dart';
import '../Widgets/AuthButton.dart';

class OtpCodeScreen extends StatefulWidget {
  static const String name = "/OtpVerify";

  const OtpCodeScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _OtpCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final OTPverifyController otPverifyController =
      Get.find<OTPverifyController>();

  late RxInt StartTime = 30.obs;

  void TimeR() {
    StartTime.value = 30;
    Timer.periodic(Duration(seconds:1), (time) {
      if (StartTime.value == 0) {
        time.cancel();
      } else {
        StartTime.value--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    TimeR();
  }

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
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium!.copyWith(color: Colors.orange),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: PinCodeTextField(
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your valid OTP";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      inactiveBorderWidth: 3,
                      activeBorderWidth: 3,
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
                GetBuilder<OTPverifyController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.Loading == false,
                      replacement: Center(child: CircularProgressIndicator()),
                      child: AuthButton(
                        text: AppLocalizations.of(context)!.done,
                        ontap: () {
                          if (_formKey.currentState!.validate()) {
                            _verify();
                          }
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 48),
                Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: StartTime.value != 0,
                        child: Text(
                          'The Code Will Expire In $StartTime Second',
                          style: textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Visibility(
                        visible: StartTime.value == 0,
                        child: GestureDetector(
                          onTap: () {
                            TimeR();
                          },
                          child: Text(
                            context.local.resendCode,
                            style: textTheme.titleMedium!.copyWith(
                              color: AppColors.themeColors,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _verify() async {
    VerifyOtpReqModel verifyOtpReqModel = VerifyOtpReqModel.formJsom(
      email: widget.email,
      Otp: _OtpCodeController.text,
    );
    bool res = await otPverifyController.VerifyOTP(verifyOtpReqModel);

    if (res) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen.name,
        (_) => false,
      );
    } else {
      ShowMessage(context, otPverifyController.errorMsg.toString(), true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _OtpCodeController.dispose();
  }
}
