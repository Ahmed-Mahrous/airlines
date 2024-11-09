import 'package:airlines/core/routes/app_router.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/core/utils/screen_utils.dart';
import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AirlineCard extends StatelessWidget {
  const AirlineCard({super.key, required this.airline});
  final AirlineModel? airline;

  @override
  Widget build(BuildContext context) {
    var height = ScreenUtils.getScreenHeight(context);
    return Card(
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kDetailsScreen, extra: airline);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.2,
              child: CachedNetworkImage(
                imageUrl: AppStrings.baseUrl + airline!.logo,
                placeholder: (context, url) =>
                    CircularProgressIndicator(), // Placeholder while loading
                errorWidget: (context, url, error) => Icon(
                    Icons.error), // Error widget if the image fails to load
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                overflow: TextOverflow.ellipsis,
                airline!.name,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
