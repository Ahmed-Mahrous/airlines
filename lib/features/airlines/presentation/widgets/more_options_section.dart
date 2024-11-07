import 'package:airlines/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

enum OptionsItem { all, fav, cancel }

class MoreOptionsSection extends StatefulWidget {
  const MoreOptionsSection({super.key});
  @override
  State<MoreOptionsSection> createState() => _MoreOptionsSectionState();
}

class _MoreOptionsSectionState extends State<MoreOptionsSection> {
  OptionsItem selectedItem = OptionsItem.all;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
            selectedItem == OptionsItem.fav
                ? AppStrings.favLabel
                : AppStrings.allLabel,
            style:
                const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
        const Spacer(),
        PopupMenuButton<OptionsItem>(
          initialValue: selectedItem,
          onSelected: (OptionsItem item) {
            setState(() {
              if (item != OptionsItem.cancel) {
                selectedItem = item;
              }
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<OptionsItem>>[
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
    );
  }
}
