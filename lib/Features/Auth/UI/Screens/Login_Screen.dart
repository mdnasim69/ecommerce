import 'package:ecommerce/Features/Auth/UI/Screens/SignUp_Screen.dart';
import 'package:ecommerce/Features/Auth/UI/Widgets/Logo.dart';
import 'package:ecommerce/core/extension/localization_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../Widgets/AuthButton.dart';

class LoginScreen extends StatefulWidget {
  static const String name = "login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
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
                SizedBox(height: 200),
                SvgLogo(),
                SizedBox(height: 32),
                Text(
                  AppLocalizations.of(context)!.enterYourEmailAndPassword,
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
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
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
                  text: AppLocalizations.of(context)!.login,
                  ontap: () {},
                ),
                SizedBox(height: 40),
                RichText(
                  text: TextSpan(
                    text: "${context.local.dontHaveAccount}  ",
                    style: textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, SignUpScreen.name);
                          },
                        text: context.local.signup,
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
    _passwordController.dispose();
  }
}
