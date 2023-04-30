import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/screens/login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((_) => Get.off(
          () => const LogInPage(),
        ));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/Logo Onlys.png',
              // height: 40.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/Text Only 1.png',
              // height: 40.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
