import 'package:airlines/core/utils/app_assets.dart';
import 'package:airlines/core/utils/app_colors.dart';
import 'package:airlines/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    var height = ScreenUtils.getScreenHeight(context);
    var width = ScreenUtils.getScreenWidth(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.lightGrey,
      ),
      height: height * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            SizedBox(
                width: width * 0.3,
                height: height * 0.2,
                child: Image.asset(
                  AppAssets.appLogo,
                )),
            const SizedBox(
              width: 15,
            ),
            const Text(
              'Airline Name',
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
