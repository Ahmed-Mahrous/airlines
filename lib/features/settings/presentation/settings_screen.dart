import 'package:airlines/core/utils/app_colors.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool currentValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.settingsTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
            child: Row(
          children: [
            Text(AppStrings.darkModeLabel,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w500)),
            const Spacer(),
            Switch(
              value: currentValue,
              onChanged: (value) {
                setState(() {
                  currentValue = value;
                });
              },
              activeColor: AppColors.mainColor,
            ),
          ],
        )),
      ),
    );
  }
}
