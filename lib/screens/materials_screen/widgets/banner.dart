import 'package:flutter/material.dart';

import '../../../config/size/size_config.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.maxFinite,
      height: (SizeConfig.blackSizeVertical ?? 1) * 13,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: (SizeConfig.blackSizeHorizontal ?? 1) * 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Free Voucher',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Tap to claim your \nFree discount voucher",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
