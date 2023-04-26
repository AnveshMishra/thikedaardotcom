import 'package:flutter/material.dart';

import '../../../config/styles/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);
  final int selectedIndex;
  final Function(int) onTap;

  // final primaryColor = AppColors.colorFromHex('#384247');
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6), topRight: Radius.circular(6)),
      child: BottomAppBar(
        color: AppColors.colorFromHex('#384247'),
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconBottomBar(
                    text: "Home",
                    icon: Icons.home,
                    selected: selectedIndex == 0,
                    onPressed: () {
                      onTap(0);
                    }),
                IconBottomBar(
                    text: "Materials",
                    icon: Icons.shopping_cart_outlined,
                    selected: selectedIndex == 1,
                    onPressed: () {
                      onTap(1);
                    }),
                IconBottomBar(
                    text: "My projects",
                    icon: Icons.sticky_note_2_outlined,
                    selected: selectedIndex == 2,
                    onPressed: () {
                      onTap(2);
                    }),
                IconBottomBar(
                    text: "My designs",
                    icon: Icons.design_services_outlined,
                    selected: selectedIndex == 3,
                    onPressed: () {
                      onTap(3);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color.fromARGB(255, 200, 158, 91);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon:
              Icon(icon, size: 25, color: selected ? accentColor : Colors.grey),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected ? accentColor : Colors.grey),
        )
      ],
    );
  }
}
