import 'package:airlines/core/utils/app_assets.dart';
import 'package:airlines/core/utils/app_colors.dart';
import 'package:airlines/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({super.key});

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    var height = ScreenUtils.getScreenHeight(context);
    var width = ScreenUtils.getScreenWidth(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.lightGrey,
      ),
      height: height * 0.2,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Airline Name',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 33,
                      width: 33,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                            icon: isFav
                                ? const Icon(Icons.favorite_outline,
                                    color: AppColors.mainColor, size: 20)
                                : const Icon(Icons.favorite,
                                    color: AppColors.mainColor, size: 20)),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 33,
                      width: 33,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                            icon: const Icon(Icons.share_rounded,
                                color: AppColors.mainColor, size: 20)),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
