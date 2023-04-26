import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/size/size_config.dart';

class IconsButton extends StatelessWidget {
  final String text;
  const IconsButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.w),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 36,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            text,
            style: Theme.of(context).primaryTextTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
