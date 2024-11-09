import 'package:airlines/core/routes/app_router.dart';
import 'package:airlines/core/utils/app_assets.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/features/home/presentation/manager/cubit/more_options_cubit/more_options_cubit.dart';
import 'package:airlines/features/home/presentation/manager/cubit/more_options_cubit/more_options_cubit_states.dart';
import 'package:airlines/features/home/presentation/views/widgets/airlines_section.dart';
import 'package:airlines/features/home/presentation/views/widgets/fav_airlines_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late OptionsItem selectedOption;
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
          actions: [
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSearchScreen);
                }),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSettingsScreen);
              },
            ),
          ],
          centerTitle: true,
          title: Text(AppStrings.appTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<MoreOptionsCubit, MoreOptionsCubitStates>(
            builder: (context, state) {
              var moreOptionsCubit = context.read<MoreOptionsCubit>();
              OptionsItem selectedOption;
              if (state is FavAirlinesOptionState) {
                selectedOption = state.selectedOption;
              } else if (state is AllAirlinesOptionState) {
                selectedOption = state.selectedOption;
              } else {
                selectedOption = OptionsItem.all;
              }
              return Column(
                children: [
                  // More options section
                  Row(
                    children: [
                      Text(
                          state is FavAirlinesOptionState
                              ? AppStrings.favLabel
                              : AppStrings.allLabel,
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500)),
                      const Spacer(),
                      PopupMenuButton<OptionsItem>(
                        initialValue: selectedOption,
                        onSelected: (OptionsItem item) {
                          if (item != OptionsItem.cancel) {
                            if (item == OptionsItem.fav) {
                              moreOptionsCubit.getFavAirlines();
                            } else {
                              moreOptionsCubit.getAllAirlines();
                            }
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<OptionsItem>>[
                          PopupMenuItem<OptionsItem>(
                            value: OptionsItem.all,
                            child: Text(AppStrings.allAirLines),
                          ),
                          PopupMenuItem<OptionsItem>(
                            value: OptionsItem.fav,
                            child: Text(AppStrings.fav),
                          ),
                          PopupMenuItem<OptionsItem>(
                            value: OptionsItem.cancel,
                            child: Text(AppStrings.cancel),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  // Airlines section
                  state is FavAirlinesOptionState
                      ? const Expanded(child: FavAirlinesSection())
                      : const Expanded(child: AirlinesSection()),
                ],
              );
            },
          ),
        ));
  }
}
