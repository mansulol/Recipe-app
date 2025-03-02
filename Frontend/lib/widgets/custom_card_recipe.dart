import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_card_model.dart';
import 'package:recipe_app/screens/recipe_screen.dart';
import 'package:recipe_app/utils/constants.dart';

class CustomCardRecipe extends StatelessWidget {
  final RecipeCardModel recipe;
  const CustomCardRecipe(this.recipe, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryColor, width: 1),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecipeScreen(recipe.id ?? "")),
          );
        },
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                width: 120,
                height: 92,
                child: Image(
                  image: AssetImage('assets/images/Papas_arrugadas.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              // margin: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name ?? "No name",
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: AppTextStyles.subTitle.fontSize,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppTextStyles.subTitle.fontFamily,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text("Servings: ${recipe.servingMax}"),
                  Text("Cook Time: ${recipe.cookTime} mins"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [...specRecipeMap(recipe.nutrition)],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Row> specRecipeMap(Map<String, dynamic>? specs) {
  List<Row> nutrition = [];

  specs?.forEach((spec, value) {
    nutrition.add(specRecipeText(spec, value));
  });

  return nutrition;
}

Row specRecipeText(String spec, dynamic quantity) {
  return Row(
    spacing: 3,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        spec,
        style: TextStyle(
          fontSize: AppTextStyles.bodySmall.fontSize,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '${quantity.toString()}g',
        style: TextStyle(
          fontSize: AppTextStyles.bodySmall.fontSize,
          // fontWeight: FontWeight.w500
        ),
      ),
    ],
  );
}
