import 'package:flutter/material.dart';
import 'package:thikedaardotcom/config/size/size_config.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const AppButton({super.key, required this.text, required this.onTap});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> with TickerProviderStateMixin {
  late AnimationController _buttonAnimationController;
  late AnimationController _colorAnimationController;
  late Animation _buttonColorAnimation;
  late Animation _textColorAnimation;

  @override
  void initState() {
    super.initState();
    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.1,
    );

    _colorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _buttonColorAnimation = ColorTween(
      begin: Colors.amber,
      end: Colors.black,
    ).animate(_colorAnimationController)
      ..addListener(() {
        setState(() {});
      });

    _textColorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.amber,
    ).animate(_colorAnimationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: ScaleTransition(
        scale: _buttonAnimationController,
        child: Container(
          margin: const EdgeInsets.only(left: 32, right: 32),
          // constraints: BoxConstraints(),
          height: (SizeConfig.blackSizeVertical ?? 1) * 7,
          decoration: BoxDecoration(
            color: _buttonColorAnimation.value,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(widget.text,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineMedium
                    ?.copyWith(
                        color: _textColorAnimation.value,
                        fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    _buttonAnimationController.forward().then((value) {
      _colorAnimationController.forward().then((value) =>
          {_colorAnimationController.reverse(), widget.onTap.call()});
      _buttonAnimationController.reverse();
    });
  }

  @override
  void dispose() {
    try {
      _buttonAnimationController.dispose();
      _colorAnimationController.dispose();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }

    super.dispose();
  }
}
