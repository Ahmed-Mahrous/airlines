import 'package:airlines/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              AppStrings.splashTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          );
        });
  }
}
