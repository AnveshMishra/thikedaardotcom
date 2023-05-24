import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/config/styles/app_colors.dart';
import 'package:thikedaardotcom/screens/login_screen/controller/login_controller.dart';
import 'package:thikedaardotcom/screens/login_screen/login_screen.dart';

class ProfileUI extends StatelessWidget {
  static const String path = "lib/src/pages/settings/settings2.dart";
  final TextStyle whiteText = const TextStyle(
    color: Colors.white,
  );
  final TextStyle whiteBoldText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 14.sp,
  );
  final TextStyle greyTExt = TextStyle(
    fontSize: 14.sp,
    color: Colors.grey.shade400,
  );

  ProfileUI({super.key});
  @override
  Widget build(BuildContext context) {
    var loginDetails = Get.find<LoginController>();
    return Scaffold(
      backgroundColor: AppColors.bottomNavigationBarColor,
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            brightness: Brightness.dark,
            primaryColor: Colors.purple,
          ),
          child: DefaultTextStyle(
            style: const TextStyle(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30.0),
                  Container(
                    width: 120.sp,
                    height: 120.sp,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Logo Onlys.png'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ListTile(
                    title: Text(
                      "UserName",
                      style: whiteBoldText,
                    ),
                    subtitle: Text(
                      loginDetails.apiResponse.data?.username ?? '',
                      style: greyTExt,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      "Email Id",
                      style: whiteBoldText,
                    ),
                    subtitle: Text(
                      loginDetails.apiResponse.data?.email ?? '',
                      style: greyTExt,
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 48.sp,
                  ),
                  ListTile(
                    trailing: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Logout",
                      style: whiteBoldText,
                    ),
                    onTap: () {
                      Get.off(() => const LogInPage());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
