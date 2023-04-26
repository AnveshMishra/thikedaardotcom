import 'package:flutter/material.dart';

import '../../../config/size/size_config.dart';

class HeaderWidget extends StatelessWidget {
  final String text;
  const HeaderWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: (SizeConfig.blackSizeHorizontal ?? 1) * 4.6),
        ),
        const Spacer(),
        const Text(
          "View more",
        ),
        const Icon(Icons.arrow_forward)
      ],
    );
  }
}
