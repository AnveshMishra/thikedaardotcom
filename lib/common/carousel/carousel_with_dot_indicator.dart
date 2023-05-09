import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'carousel_options.dart';
import 'carousel_slider.dart';

class CarauselWithDotIndicator extends StatefulWidget {
  final double? viewPortFraction;
  final List<Widget> items;
  const CarauselWithDotIndicator(
      {super.key, required this.items, this.viewPortFraction});

  @override
  State<CarauselWithDotIndicator> createState() =>
      _CarauselWithDotIndicatorState();
}

class _CarauselWithDotIndicatorState extends State<CarauselWithDotIndicator> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.items,
          options: CarouselOptions(
            viewportFraction: widget.viewPortFraction ?? 1,
            autoPlay: true,
            onPageChanged: (index, reason) => _currentIndex.value = index,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (BuildContext context, int value, Widget? child) {
            return DotsIndicator(
              dotsCount: widget.items.length,
              position: _currentIndex.value.toDouble(),
            );
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }
}
