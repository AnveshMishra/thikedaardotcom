import 'package:flutter/material.dart';
import 'package:thikedaardotcom/common/carousel/carousel_options.dart';

import '../../common/carousel/carousel_slider.dart';
import '../../common/carousel/carousel_with_dot_indicator.dart';
import '../my_projects_screen/widgets/app_button.dart';

class DesignYourHomeScreen extends StatelessWidget {
  const DesignYourHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Home > Design Your Home",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.person,
                      size: 36,
                    )),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CarauselWithDotIndicator(
              items: [
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 32,
            ),
            AppButton(
              key: const ValueKey("2D LAYOUT"),
              text: "2D LAYOUT",
              onTap: () => {},
            ),
            const SizedBox(
              height: 32,
            ),
            AppButton(
              key: const ValueKey("3D LAYOUT"),
              text: "3D LAYOUT",
              onTap: () => {},
            ),
            const SizedBox(
              height: 32,
            ),
            AppButton(
              key: const ValueKey("VIRTUAL WALKTHROUGH"),
              text: "VIRTUAL WALKTHROUGH",
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
