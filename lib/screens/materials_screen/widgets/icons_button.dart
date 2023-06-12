import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IconsButton extends StatelessWidget {
  final String text;
  final String image;

  const IconsButton({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.sp,
      child: Padding(
        padding: EdgeInsets.only(right: 2.w),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.clear,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.network(image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 64.sp,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.bodySmall,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
