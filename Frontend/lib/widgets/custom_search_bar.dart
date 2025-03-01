import 'package:flutter/material.dart';
import 'package:recipe_app/utils/constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 50,
      color: AppColors.gray20,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: AppTextStyles.subTitle.fontSize,
          fontFamily: AppTextStyles.subTitle.fontFamily,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.gray20,
          hintText: "Search Your Saved Recipe...",
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search, size: 30),
          suffixIconColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
