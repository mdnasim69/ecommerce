import 'package:ecommerce/Features/Auth/UI/Screens/Login_Screen.dart';
import 'package:ecommerce/Features/Auth/UI/Screens/OtpCode_Screen.dart';
import 'package:ecommerce/Features/Auth/UI/Widgets/Logo.dart';
import 'package:ecommerce/core/extension/localization_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _deliveryAddressController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                AuthButton(
                  text: AppLocalizations.of(context)!.signup,
                  ontap: () {
                    Navigator.pushNamed(context, OtpCodeScreen.name);
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
