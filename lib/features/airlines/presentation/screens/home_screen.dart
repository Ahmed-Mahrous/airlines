import 'package:airlines/core/utils/app_assets.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/features/airlines/presentation/widgets/airlines_section.dart';
import 'package:airlines/features/airlines/presentation/widgets/more_options_section.dart';
import 'package:airlines/features/airlines/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          leadingWidth: 60.0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SvgPicture.asset(AppAssets.appBarIcon),
          ),
          centerTitle: true,
          title: Text(AppStrings.appTitle),
        ),
        body: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              SearchField(),
              SizedBox(height: 15.0),
              MoreOptionsSection(),
              SizedBox(height: 15.0),
              Expanded(child: AirlinesSection()),
            ],
          ),
        ));
  }
}
