import 'package:airlines/core/utils/app_colors.dart';
import 'package:airlines/core/widgets/failure_widget.dart';
import 'package:airlines/features/home/presentation/manager/cubit/airlines_cubit/airlines_cubit.dart';
import 'package:airlines/features/home/presentation/manager/cubit/airlines_cubit/airlines_cubit_states.dart';
import 'package:airlines/features/home/presentation/views/widgets/airline_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirlinesSection extends StatefulWidget {
  const AirlinesSection({super.key});
  @override
  State<AirlinesSection> createState() => _AirlinesSectionState();
}

class _AirlinesSectionState extends State<AirlinesSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AirlinesCubit, AirlinesCubitStates>(
      builder: (context, state) {
        if (state is AirlinesLoaded) {
          var airlinesList = state.airlines;
          return GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.8,
              crossAxisCount: 2,
            ),
            // Adjust to control width-to-height ratio),
            itemCount: airlinesList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AirlineCard(
                airline: airlinesList[index],
              );
            },
          );
        } else if (state is AirlinesError) {
          return FailureWidget(error: state.message);
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ));
        }
      },
    );
  }
}
