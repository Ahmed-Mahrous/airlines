import 'dart:async';

import 'package:airlines/core/utils/app_colors.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/features/home/presentation/manager/cubit/fav_cubit/fav_cubit.dart';
import 'package:airlines/features/home/presentation/manager/cubit/fav_cubit/fav_cubit_states.dart';
import 'package:airlines/features/home/presentation/views/widgets/airline_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavAirlinesSection extends StatefulWidget {
  const FavAirlinesSection({super.key});

  @override
  State<FavAirlinesSection> createState() => _FavAirlinesSectionState();
}

class _FavAirlinesSectionState extends State<FavAirlinesSection> {
  late final StreamSubscription subscription;
  @override
  void initState() {
    super.initState();
    // Subscribe to the cubit's state stream to listen to updates
    subscription = context.read<FavCubit>().stream.listen((state) {
      print("State changed: $state"); // Log state changes to console
    });
  }

  @override
  void dispose() {
    // Unsubscribe from the cubit's state stream when the widget is disposed
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavCubitStates>(builder: (context, state) {
      var favCubit = context.read<FavCubit>();
      if (state is CachedFavListLoaded ||
          state is FavListAdded ||
          state is FavListRemoved ||
          state is FavListUpdated ||
          state is FavListCached) {
        if ((state as dynamic).favList.isEmpty) {
          return Center(
            child: Text(
              AppStrings.noFavYet,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          );
        } else {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.8,
              crossAxisCount: 2,
            ),
            // Adjust to control width-to-height ratio),
            itemCount: (state as dynamic).favList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Stack(children: [
                AirlineCard(
                  airline: (state as dynamic).favList[index],
                ),
                Positioned(
                  top: 15,
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
                            favCubit
                                .removeFav((state as dynamic).favList[index]);
                          },
                          icon: const Icon(Icons.delete,
                              color: AppColors.mainColor, size: 20)),
                    ),
                  ),
                )
              ]);
            },
          );
        }
      } else {
        return Center(
          child: Text(
            AppStrings.noFavYet,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        );
      }
    });
  }
}
