import 'package:airlines/core/utils/app_colors.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.lightGrey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.phone),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.phoneLabel,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '+91 1234567890',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: AppColors.darkGrey,
                  thickness: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.web),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.websiteLabel,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'www.airline.com',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
