import 'package:flutter/material.dart';
import 'package:recipe_app/utils/constants.dart';

class CustomCardRecipe extends StatelessWidget {
  const CustomCardRecipe({super.key});

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
                  "Papas Arrugadas",
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: AppTextStyles.subTitle.fontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppTextStyles.subTitle.fontFamily,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text("Servings: 4"),
                Text("Cook Time: 10 mins"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    specRecipeText("Prot", 13),
                    specRecipeText("Carbs", 62.5),
                    specRecipeText("Fibre", 3.1),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Row specRecipeText(String spec, double quantity) {
  return Row(
    spacing: 3,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        spec,
        style: TextStyle(
          fontSize: AppTextStyles.bodySmall.fontSize,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold
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
