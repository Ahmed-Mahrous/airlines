import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/features/details/presentation/views/widgets/contact_info_card.dart';
import 'package:airlines/features/details/presentation/views/widgets/details_card.dart';
import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:flutter/material.dart';

class AirlineDetailsScreen extends StatefulWidget {
  const AirlineDetailsScreen({super.key, required this.airline});
  final AirlineModel airline;
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
              DetailsCard(
                airline: widget.airline,
              ),
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
              ContactInfoCard(
                airline: widget.airline,
              )
            ])));
  }
}
