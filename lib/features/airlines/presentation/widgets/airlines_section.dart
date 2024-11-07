import 'package:airlines/core/utils/app_assets.dart';
import 'package:airlines/core/utils/app_colors.dart';
import 'package:airlines/core/utils/screen_utils.dart';
import 'package:airlines/features/airlines/presentation/widgets/airline_card.dart';
import 'package:flutter/material.dart';

class AirlinesSection extends StatefulWidget {
  const AirlinesSection({super.key});

  @override
  State<AirlinesSection> createState() => _AirlinesSectionState();
}

class _AirlinesSectionState extends State<AirlinesSection> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    var height = ScreenUtils.getScreenHeight(context);
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
        crossAxisCount: 2,
      ), // Adjust to control width-to-height ratio),
      itemCount: airlines.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Stack(children: [
          AirlineCard(airLinesList: airlines, index: index),
          Positioned(
            top: 10,
            right: 15,
            child: Container(
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
          )
        ]);
      },
    );
  }
}

List<Map<String, dynamic>> airlines = [
  {'name': 'Airline Name', 'image': AppAssets.appLogo},
  {'name': 'Airline Name', 'image': AppAssets.appLogo},
  {'name': 'Airline Name', 'image': AppAssets.appLogo},
  {'name': 'Airline Name', 'image': AppAssets.appLogo},
  {'name': 'Airline Name', 'image': AppAssets.appLogo},
  {'name': 'Airline Name', 'image': AppAssets.appLogo},
];
