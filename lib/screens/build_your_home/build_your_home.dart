import 'package:flutter/material.dart';

import '../../common/carousel/carousel_with_dot_indicator.dart';
import '../my_projects_screen/widgets/app_button.dart';

class BuildYourHome extends StatelessWidget {
  const BuildYourHome({super.key});

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
                  "Home > Build Your Home",
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
              text: "TURNKEY SOLUTION",
              onTap: () => {},
            ),
            const SizedBox(
              height: 32,
            ),
            AppButton(
              text: "CONTRACTORS",
              onTap: () => {},
            ),
            const SizedBox(
              height: 32,
            ),
            AppButton(
              text: "SHOP MATERIALS",
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
