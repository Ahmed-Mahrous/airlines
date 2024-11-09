import 'package:airlines/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.oopsPic),
        const SizedBox(
          height: 20,
        ),
        Text(error.toUpperCase(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
