import 'package:flutter/material.dart';
import 'package:recipe_app/utils/constants.dart';
import 'package:recipe_app/widgets/custom_card_recipe.dart';
// import 'package:recipe_app/utils/constants.dart';
import 'package:recipe_app/widgets/custom_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Recipe App", style: TextStyle(
          fontSize: AppTextStyles.titleApp.fontSize,
          fontFamily: AppTextStyles.title.fontFamily,
          fontWeight: FontWeight.w900,
          color: AppColors.primaryColor
        ),),
      ),
      body: Column(
        children: [
          CustomSearchBar(),
          Column(
            children: [
              CustomCardRecipe(),
              CustomCardRecipe(),
              CustomCardRecipe()
            ],
          )
        ],
      )
    );
  }
}