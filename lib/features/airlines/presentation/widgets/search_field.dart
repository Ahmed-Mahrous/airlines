import 'package:airlines/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onChanged: (value) {},
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
          hintText: "Enter airline name",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
