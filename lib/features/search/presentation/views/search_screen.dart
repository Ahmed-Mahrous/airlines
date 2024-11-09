import 'package:airlines/core/utils/app_colors.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/features/home/presentation/manager/cubit/airlines_cubit/airlines_cubit.dart';
import 'package:airlines/features/home/presentation/manager/cubit/airlines_cubit/airlines_cubit_states.dart';
import 'package:airlines/features/search/presentation/views/widgets/search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(AppStrings.searchTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: BlocBuilder<AirlinesCubit, AirlinesCubitStates>(
            builder: (context, state) {
              var airlinesCubit = context.read<AirlinesCubit>();
              return Column(children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {
                    setState(() {
                      airlinesCubit.filterByName(value);
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: AppColors.darkGrey),
                    fillColor: AppColors.lightGrey,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide.none,
                    ),
                    hintText: AppStrings.searchHint,
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 15.0),
                airlinesCubit.filteredList.isEmpty
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.noSearchResult,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: airlinesCubit.filteredList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SearchCard(
                                  airline: airlinesCubit.filteredList[index],
                                ),
                              );
                            }),
                      )
              ]);
            },
          ),
        ),
      ),
    );
  }
}
