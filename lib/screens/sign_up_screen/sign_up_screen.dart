import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/config/styles/app_colors.dart';
import 'package:thikedaardotcom/screens/login_screen/login_screen.dart';

import '../../common/carousel/carousel_with_dot_indicator.dart';
import 'widgets/form_fields.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
            radius: 0.5,
            colors: [AppColors.appAccentAmber, Colors.white],
            center: Alignment.bottomLeft),
      ),
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
              const FormFields(
                label: 'User Name',
                hintText: 'Enter your username',
              ),
              SizedBox(
                height: 2.h,
              ),
              const FormFields(
                label: 'Email Address',
                hintText: 'Enter your email address',
              ),
              SizedBox(
                height: 2.h,
              ),
              const FormFields(
                label: 'Password',
                hintText: 'Choose a strong password',
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.appAccentAmber,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  // onPressed: () => {},
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 16.w),
                    child: Text(
                      'Register',
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
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
    );
  }
}
