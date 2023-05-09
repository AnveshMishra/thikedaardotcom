import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FormFields extends StatelessWidget {
  const FormFields({super.key, required this.label, required this.hintText});
  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).primaryTextTheme.headlineMedium,
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border:
                    Border.all(color: Colors.black, style: BorderStyle.solid)),
            child: TextField(
              decoration: InputDecoration(
                  //errorText: emailErr,
                  hintText: hintText,
                  contentPadding: const EdgeInsets.all(15),
                  border: InputBorder.none),
              onChanged: (value) {
                // Do something
              },
            ),
          ),
        ],
      ),
    );
  }
}
