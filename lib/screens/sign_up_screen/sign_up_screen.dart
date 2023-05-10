import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/config/styles/app_colors.dart';
import 'package:thikedaardotcom/screens/login_screen/login_screen.dart';
import 'package:thikedaardotcom/screens/sign_up_screen/controller/sign_up_controller.dart';

import '../../common/carousel/carousel_with_dot_indicator.dart';
import '../../network/api_response.dart';
import 'widgets/form_fields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpController _controller;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = Get.find<SignUpController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
            radius: 0.5,
            colors: [AppColors.appAccentAmber, Colors.white],
            center: Alignment.bottomLeft),
      ),
      child: Form(
        key: formGlobalKey,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Get.off(() => const LogInPage()),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'Register',
              style: Theme.of(context).primaryTextTheme.headlineLarge,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                CarauselWithDotIndicator(
                  viewPortFraction: 0.79,
                  items: [
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'You are registering as a User',
                  style: Theme.of(context).primaryTextTheme.headlineLarge,
                ),
                SizedBox(
                  height: 4.h,
                ),
                FormFields(
                  label: 'User Name',
                  hintText: 'Enter your username',
                  controller: userNameController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormFields(
                  label: 'Email Address',
                  hintText: 'Enter your email address',
                  controller: emailController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                FormFields(
                  label: 'Password',
                  hintText: 'Choose a strong password',
                  controller: passwordController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 2.h,
                ),
                GetBuilder<SignUpController>(
                  builder: (ctr) => InkWell(
                    onTap: () => _signUp(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.appAccentAmber,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 16.w),
                        child:
                            ctr.apiResponse.status == ApiResponseStatus.loading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Register',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyMedium,
                                  ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      "Already have an account? Login",
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                    ),
                  ),
                  onTap: () => Get.off(
                    () => const LogInPage(),
                  ),
                ),
                SizedBox(
                  height: 4.h,
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
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  _signUp() async {
    if (formGlobalKey.currentState?.validate() ?? false) {
      await _controller.signUp(
        userName: userNameController.text,
        password: passwordController.text,
        email: emailController.text,
      );
    }
  }
}
