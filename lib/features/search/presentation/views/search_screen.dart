import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/features/search/presentation/views/widgets/search_field.dart';
import 'package:airlines/features/search/presentation/views/widgets/search_card.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.searchTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(children: [
            const SearchField(),
            const SizedBox(height: 15.0),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: SearchCard(),
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
