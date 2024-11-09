import 'package:airlines/core/routes/app_router.dart';
import 'package:airlines/core/utils/app_colors.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/core/utils/screen_utils.dart';
import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.airline});
  final AirlineModel airline;
  @override
  Widget build(BuildContext context) {
    var height = ScreenUtils.getScreenHeight(context);
    var width = ScreenUtils.getScreenWidth(context);
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsScreen, extra: airline);
      },
      child: Container(
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
                  child: Image.network(
                    AppStrings.baseUrl + airline.logo,
                  )),
              const SizedBox(
                width: 15,
              ),
              Text(
                airline.name,
                style: const TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
