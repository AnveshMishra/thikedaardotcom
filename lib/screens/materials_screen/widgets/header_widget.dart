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
          style: Theme.of(context).primaryTextTheme.headlineMedium,
        ),
        const Spacer(),
        Text(
          "View more",
          style: Theme.of(context)
              .primaryTextTheme
              .headlineSmall
              ?.copyWith(color: Colors.grey.shade600),
        ),
        const Icon(Icons.arrow_forward)
      ],
    );
  }
}
