import 'package:airlines/core/theme_provider/theme_provider.dart';
import 'package:airlines/core/utils/app_colors.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
              activeColor: AppColors.mainColor,
            ),
          ],
        )),
      ),
    );
  }
}
