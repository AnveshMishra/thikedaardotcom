import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thikedaardotcom/network/api_response.dart';
import 'package:thikedaardotcom/screens/login_screen/controller/login_controller.dart';
import 'package:thikedaardotcom/screens/sign_up_screen/sign_up_screen.dart';

import '../../config/size/size_config.dart';
import '../../config/styles/app_colors.dart';
import '../../config/styles/app_styles.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  get onChanged => null;
  TextEditingController emailCtrl = TextEditingController(text: '');
  TextEditingController passCtrl = TextEditingController(text: '');
  String? email;
  String? password;
  String? emailErr = '';
  String passwordErr = '';
  late LoginController _controller;
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      emailCtrl = TextEditingController(text: '');
      passCtrl = TextEditingController(text: '');
    }
    _controller = Get.find<LoginController>();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Form(
      key: formGlobalKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: (SizeConfig.blackSizeVertical ?? 0) * 45,
              width: double.infinity,
              child: Stack(children: [
                Image.asset(
                  'assets/images/tkdc.jpg',
                  height: SizeConfig.blackSizeVertical! * 45,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.15,
                            bottom: 5),
                        child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Image.asset(
                                    'assets/images/tdc_logo_text.png',
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.contain,
                                  )),
                                  Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text("Building Homes Simplified",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.appThemeColor())))
                                ]))),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                          fontSize: 25,
                          color: mBlack,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Sign in to build your Home",
                      style: TextStyle(
                          fontSize: 15,
                          color: mBlack,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: SizeConfig.screenHeight,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(58),
                          topRight: Radius.circular(58)),
                      color: Color.fromARGB(52, 245, 157, 155),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 30,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(42),
                          topRight: Radius.circular(42)),
                      color: Color.fromARGB(255, 250, 250, 250),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Form(
                  //   child:
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
                        child: Text(
                          "Email",
                          style: mOswaldBold.copyWith(
                              fontSize: 14,
                              color: mBlack,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        ),
                      ),

                      ////////////

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              //errorText: emailErr,
                              hintText: 'Email',
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                            ),
                            controller: emailCtrl,
                            onChanged: (value) {
                              // Do something
                              email = value;
                            },
                          ),
                        ),
                      ),

                      ////////

                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 14,
                              color: mBlack,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                //errorText: emailErr,
                                hintText: 'Password',
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              controller: passCtrl,
                              onChanged: (value) {
                                // Do something
                                password = value;
                              },
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Container(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 5),
                                child: Checkbox(
                                    value: false, onChanged: onChanged)),
                            Container(
                              padding: const EdgeInsets.only(
                                top: 20,
                                right: 20,
                              ),
                              child: Text(
                                "Remember Me",
                                style: mOswaldBold.copyWith(
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                    color: const Color(0xff9891bd),
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ]),
                          Container(
                            padding: const EdgeInsets.only(top: 20, right: 20),
                            child: Text(
                              "Forgot password?",
                              style: mOswaldBold.copyWith(
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  color: const Color(0xff9891bd),
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  GetBuilder<LoginController>(builder: (controller) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: 50,
                      child: TextButton(
                        key: const ValueKey("btnLogin"),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(context, '/home');
                          userLogin();
                          // Get.to(const NavScreen());
                        },
                        child: (controller.apiResponse.status ==
                                ApiResponseStatus.loading)
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "LOGIN",
                                style: mOswaldBold.copyWith(
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    );
                  }),
                  GestureDetector(
                    child: const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Dont have an account? Create a new one"),
                    ),
                    onTap: () {
                      Get.off(() => const SignUpScreen());
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  userLogin() async {
    if (formGlobalKey.currentState?.validate() ?? false) {
      await _controller.login(userName: email ?? '', password: password ?? '');
    }
  }
}
