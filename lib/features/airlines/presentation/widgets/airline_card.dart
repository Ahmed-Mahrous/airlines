import 'package:airlines/core/routes/app_router.dart';
import 'package:airlines/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AirlineCard extends StatelessWidget {
  AirlineCard({super.key, required this.airLinesList, required this.index});
  final List<Map<String, dynamic>> airLinesList;
  final int index;
  @override
  Widget build(BuildContext context) {
    var height = ScreenUtils.getScreenHeight(context);
    return Card(
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kDetailsScreen);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: height * 0.2,
                child: Image.asset(airLinesList[index]['image'])),
            const SizedBox(height: 10),
            Text(
              airLinesList[index]['name'],
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
