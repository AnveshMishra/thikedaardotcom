import 'package:flutter/material.dart';

import '../../../config/size/size_config.dart';

class ProductWidget extends StatelessWidget {
  final String text;

  const ProductWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.black,
          height: (SizeConfig.blackSizeVertical ?? 1) * 10,
        ),
        SizedBox(
          height: (SizeConfig.blackSizeVertical ?? 1) * 2,
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: (SizeConfig.blackSizeVertical ?? 1) * 0.5,
        ),
        Row(
          children: List.generate(
              5,
              (index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 8,
                  )),
        ),
        const Text(
          r"$12",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: (SizeConfig.blackSizeVertical ?? 1) * 2,
        ),
      ],
    );
  }
}
