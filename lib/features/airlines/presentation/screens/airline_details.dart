import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/features/airlines/presentation/widgets/contact_info_card.dart';
import 'package:airlines/features/airlines/presentation/widgets/details_card.dart';
import 'package:flutter/material.dart';

class AirlineDetailsScreen extends StatefulWidget {
  const AirlineDetailsScreen({super.key});

  @override
  State<AirlineDetailsScreen> createState() => _AirlineDetailsScreenState();
}

class _AirlineDetailsScreenState extends State<AirlineDetailsScreen> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              const DetailsCard(),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(AppStrings.contactInfoLabel,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500)),
                  const Spacer()
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const ContactInfoCard()
            ])));
  }
}
