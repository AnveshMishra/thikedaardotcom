import 'package:flutter/material.dart';

import '../../../config/size/size_config.dart';

class IconsButton extends StatelessWidget {
  const IconsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: (SizeConfig.blackSizeVertical ?? 1) * 1.4,
        ),
        const Text("text"),
      ],
    );
  }
}
