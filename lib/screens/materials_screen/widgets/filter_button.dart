import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/config/styles/fonts.dart';

class FilterButton extends StatelessWidget {
  final bool isSelected;
  final String text;
  const FilterButton({super.key, required this.isSelected, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.w),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.amber : Colors.white,
          border: Border.all(
            width: 0.8,
            color: isSelected ? Colors.amber : Colors.grey.shade700,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: roboto,
                color: isSelected ? Colors.white : Colors.grey.shade600,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
