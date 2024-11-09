import 'package:airlines/core/utils/app_colors.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/core/utils/screen_utils.dart';
import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:airlines/features/home/presentation/manager/cubit/fav_cubit/fav_cubit.dart';
import 'package:airlines/features/home/presentation/manager/cubit/fav_cubit/fav_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({super.key, required this.airline});

  final AirlineModel airline;

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    var width = ScreenUtils.getScreenWidth(context);
    return BlocBuilder<FavCubit, FavCubitStates>(
      builder: (context, state) {
        var favCubit = context.read<FavCubit>();
        bool isFav = favCubit.favList.contains(widget.airline) ? true : false;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(children: [
              Center(
                child: Column(
                  children: [
                    Image.network(
                      AppStrings.baseUrl + widget.airline.logo,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.airline.name,
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 33,
                  width: 33,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          isFav = !isFav;
                          if (isFav) {
                            favCubit.addFav(widget.airline);
                            Fluttertoast.showToast(
                              msg: "Airline added to favorites",
                              toastLength:
                                  Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
                              gravity: ToastGravity
                                  .BOTTOM, // position: top, bottom, center
                              fontSize: 16.0,
                            );
                          } else {
                            favCubit.removeFav(widget.airline);
                            Fluttertoast.showToast(
                              msg: "Airline removed from favorites",
                              toastLength:
                                  Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
                              gravity: ToastGravity
                                  .BOTTOM, // position: top, bottom, center
                              fontSize: 16.0,
                            );
                          }
                        },
                        icon: isFav
                            ? const Icon(Icons.favorite,
                                color: AppColors.mainColor, size: 20)
                            : const Icon(Icons.favorite_outline,
                                color: AppColors.mainColor, size: 20)),
                  ),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
