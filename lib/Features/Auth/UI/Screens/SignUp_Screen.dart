import 'package:ecommerce/Features/Auth/UI/Controllers/SignUp_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/Login_Screen.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/OtpCode_Screen.dart';
import 'package:ecommerce/Features/Auth/UI/Widgets/Logo.dart';
import 'package:ecommerce/Features/Auth/data/Models/SignUpReqModel.dart';
import 'package:ecommerce/core/Message/message.dart';
import 'package:ecommerce/core/extension/localization_extension.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../l10n/app_localizations.dart';
import '../Widgets/AuthButton.dart';

class SignUpScreen extends StatefulWidget {
  static const String name = "signup";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscure = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _deliveryAddressController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignUpController signUpController = Get.find<SignUpController>();
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
                SizedBox(height: 48),
                SvgLogo(),
                SizedBox(height: 24),
                Text(
                  AppLocalizations.of(context)!.createAnAccount,
                  style: textTheme.titleMedium!.copyWith(color: Colors.black54),
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    String email = value ?? "";
                    if (!EmailValidator.validate(email)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: context.local.email,
                    hintStyle: textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter your first name ";
                    }
                    return null;
                  },
                  controller: _firstNameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: context.local.firstName,
                    hintStyle: textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter your last name ";
                    }
                    return null;
                  },
                  controller: _lastNameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: context.local.lastName,
                    hintStyle: textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    String mobile = value ?? "";
                    RegExp regexp = RegExp(r"^([01]|\+88)?\d{11}");
                    if (!regexp.hasMatch(mobile)) {
                      return "Enter a valid mobile number ";
                    }
                    return null;
                  },
                  controller: _phoneController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: context.local.phone,
                    hintStyle: textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter your delivery address ";
                    }
                    return null;
                  },
                  controller: _deliveryAddressController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: context.local.deliveryAddress,
                    hintStyle: textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if ((value?.isEmpty ?? true) || value!.length < 6) {
                      return "Enter a password more than 6 letters ";
                    }
                    return null;
                  },
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(12, 0, 8, 8),
                    suffix: IconButton(
                      onPressed: () {
                        obscure = !obscure;
                        setState(() {});
                      },
                      icon: Icon(
                        obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                    hintStyle: textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                    ),
                    hintText: context.local.password,
                  ),
                ),
                SizedBox(height: 16),
                GetBuilder<SignUpController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.Loading == false,
                      replacement: Center(child: CircularProgressIndicator()),
                      child: AuthButton(
                        text: AppLocalizations.of(context)!.signup,
                        ontap: () {
                          _signUp();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 40),
                RichText(
                  text: TextSpan(
                    text: "${context.local.alreadyHaveAccount}  ",
                    style: textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              LoginScreen.name,
                              (ll) => false,
                            );
                          },
                        text: context.local.login,
                        style: textTheme.titleLarge!.copyWith(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      SignUpReqModel signUpReqModel = SignUpReqModel.formJson(
        email: _emailController.text.trim(),
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        mobile: _phoneController.text.trim(),
        deliveryAddress: _deliveryAddressController.text.trim(),
        password: _passwordController.text,
      );
      bool res = await signUpController.SignUp(signUpReqModel);
      if (res) {
        Navigator.pushNamed(
          context,
          OtpCodeScreen.name,
          arguments: _emailController.text.trim(),
        );
      } else {
        ShowMessage(context, signUpController.errorMsg.toString(), true);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _deliveryAddressController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }
}
