import 'package:ecommerce/Features/Auth/UI/Controllers/Auth_controller.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/UpdateProfileController.dart';
import 'package:ecommerce/Features/Auth/data/Models/UpdateProfileResponseModel.dart';
import 'package:ecommerce/core/Message/message.dart';
import 'package:ecommerce/core/extension/localization_extension.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../App/app_colors.dart';
import '../Widgets/AuthButton.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String name = "/UpdateProfile";

  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool obscure = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _deliveryAddressController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    InputFilds();
  }

  InputFilds() {
    _emailController.text = authController.user!.email;
    _firstNameController.text = authController.user!.firstName;
    _lastNameController.text = authController.user!.lastName;
    _phoneController.text = authController.user!.phone;
    _deliveryAddressController.text = authController.user!.city;
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
                SizedBox(height: 8),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: AppColors.themeColors1.withOpacity(0.6),
                  child: Icon(Icons.person, size: 40, color: Colors.black),
                ),
                SizedBox(height: 24),
                Text(
                  "Update Profile",
                  style: textTheme.titleMedium!.copyWith(color: Colors.black54),
                ),
                SizedBox(height: 16),
                TextFormField(
                  enabled: false,
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
                SizedBox(height: 16),
                GetBuilder<UpdateProfileController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.Loading == false,
                      replacement: Center(child: CircularProgressIndicator()),
                      child: AuthButton(
                        text: "Update",
                        ontap: () async {
                          if (_formKey.currentState!.validate()) {
                            UpdateProfileResponseModel updatePRM =
                                UpdateProfileResponseModel.fromJson({
                                  "first_name": _firstNameController.text.trim(),
                                  "last_name": _lastNameController.text.trim(),
                                  "phone": _phoneController.text.trim(),
                                  "city": _deliveryAddressController.text.trim(),
                                });
                            bool res = await controller.updateProfile(
                              updatePRM,
                            );
                            if (res) {
                              Get.find<AuthController>().getData();
                              Navigator.pop(context);
                              ShowMessage(context, "Profile Updated");
                            } else {
                              ShowMessage(
                                context,
                                controller.errorMsg.toString(),
                              );
                            }
                          }
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      appBar: buildAppBar(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios_new),
            Text("Back", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }



  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _deliveryAddressController.dispose();
    _phoneController.dispose();
  }
}
