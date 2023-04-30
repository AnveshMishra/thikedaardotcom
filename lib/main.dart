import 'package:device_preview/device_preview.dart' as device_preview;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/bindings/bindings.dart';
import 'package:thikedaardotcom/config/theme/light_theme.dart';
import 'package:thikedaardotcom/screens/splash_screen/splash_screen.dart';
import 'screens/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put<LoginController>(LoginController());
  runApp(device_preview.DevicePreview(
      enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          GetMaterialApp(
        initialBinding: GlobalBindings(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
