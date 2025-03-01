import 'package:flutter/material.dart';
import 'package:recipe_app/utils/constants.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});


  @override
  Widget build(BuildContext context) {

  final List<String> ingredientsList = [ "8 Potatoes", "1/4 cups of Salt", "4 Cups of water", "Salsa Mojo" ];
  final List<String> preparationList = [
    "1. Wash the potatoes",
    "2. Boil the potatoes",
    "3. Add salt",
    "4. Serve with mojo"
  ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Container image
            Flexible(
              flex: 2,
              child: Stack(
                children: [
                  Image(image: AssetImage('assets/images/Papas_arrugadas.jpg')),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 60,
                      height: 25,
                      margin: EdgeInsets.all(5),
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      color: AppColors.gray30,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Papas Arrugadas",
                          style: TextStyle(
                            fontSize: AppTextStyles.title.fontSize,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.primaryFont,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container content page
            Column(
              children: [
                Container(
                  height: 55,
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.emoji_food_beverage_rounded,
                              color: AppColors.primaryColor,
                            ),
                            // SvgPicture.asset('assets/icons/meal.svg', width: 20, height: 20),
                            SizedBox(width: 5),
                            Text(
                              'Serve 1 - 4',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppTextStyles.subTitle.fontSize,
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.emoji_food_beverage_rounded,
                              color: AppColors.primaryColor,
                            ),
                            // SvgPicture.asset('assets/icons/meal.svg', width: 20, height: 20),
                            SizedBox(width: 5),
                            Text(
                              '10 mins',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppTextStyles.subTitle.fontSize,
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.emoji_food_beverage_rounded,
                              color: AppColors.primaryColor,
                            ),
                            Icon(
                              Icons.emoji_food_beverage_rounded,
                              color: AppColors.gray10,
                            ),
                            Icon(
                              Icons.emoji_food_beverage_rounded,
                              color: AppColors.gray10,
                            ),
                            // SvgPicture.asset('assets/icons/meal.svg', width: 20, height: 20),
                            SizedBox(width: 5),
                            Text(
                              'Easy',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppTextStyles.subTitle.fontSize,
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Icon(Icons.edit, color: AppColors.primaryColor),

                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: AppTextStyles.subTitle.fontSize,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.primaryFont,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Las papas arrugadas  son un plato tradicional de las  Islas Canarias, España, y son muy fáciles de preparar. Este platillo se  caracteriza por su textura única (la piel arrugada) y su sabor salado",
                        style: TextStyle(
                          fontSize: AppTextStyles.bodyBig.fontSize,
                          color: Colors.black,
                          fontFamily: AppFonts.primaryFont,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.primaryColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Icon(
                            Icons.emoji_food_beverage_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "Ingredients",
                            style: TextStyle(
                              fontSize: AppTextStyles.subTitle.fontSize,
                              color: Colors.white,
                              fontFamily: AppFonts.primaryFont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: listToColumStyler(ingredientsList, Colors.white )
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Icon(
                            Icons.emoji_food_beverage_rounded,
                            color: AppColors.primaryColor,
                          ),
                          Text(
                            "Ingredients",
                            style: TextStyle(
                              fontSize: AppTextStyles.subTitle.fontSize,
                              color: AppColors.primaryColor,
                              fontFamily: AppFonts.primaryFont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: listToColumStyler(preparationList, Colors.black )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Column listToColumStyler(List<String> ingredients, Color color) {
  return Column(
    spacing: 5,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
        ingredients.map((ingredient) {
          return Text(
            ingredient,
            style: TextStyle(
              color: color,
              fontFamily: AppFonts.primaryFont,
              fontSize: AppTextStyles.bodyBig.fontSize,
            ),
          );
        }).toList(),
  );
}
