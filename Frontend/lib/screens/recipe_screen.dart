import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/services/recipe_service.dart';
import 'package:recipe_app/utils/constants.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  RecipeScreenState createState() => RecipeScreenState();
}

class RecipeScreenState extends State<RecipeScreen> {
  RecipeModel? recipe;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadRecipe();
  }

  Future<void> loadRecipe() async {
    try {
      final data = await RecipeService().getOneRecipe(
        '67c3b952d50ec2e29583c7a7',
      );
      setState(() {
        recipe = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (errorMessage != null) {
      return Center(child: Text('Error: $errorMessage'));
    } else if (recipe != null) {
      return _buildRecipeDetails(recipe!);
    } else {
      return Center(child: Text('No data available'));
    }
  }

  Widget _buildRecipeDetails(RecipeModel recipe) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildImageContainer(context),
              _buildNutritionSection(),
              _buildDescriptionSection(recipe.description),
              _buildIngredientsSection(recipe.ingredients),
              _buildSpecsSection(),
              _buildPreparationSection(recipe.preparation),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildImageContainer(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset('assets/images/Papas_arrugadas.jpg'),
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
                  recipe?.name ?? "No name",
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
    );
  }

  Container _buildPreparationSection(List<String>? preparationList) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.emoji_food_beverage_rounded,
                color: AppColors.primaryColor,
              ),
              SizedBox(width: 5),
              Text(
                "Preparation",
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
          _listToColumnStyler(preparationList ?? [], Colors.black),
        ],
      ),
    );
  }

  Container _buildSpecsSection() {
    return Container(
      height: 55,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              children: [
                Icon(
                  Icons.emoji_food_beverage_rounded,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 5),
                Text(
                  'Serve ${recipe?.servingMin} - ${recipe?.servingMax}',
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
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              children: [
                Icon(
                  Icons.emoji_food_beverage_rounded,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 5),
                Text(
                  '${recipe?.cookTime} mins',
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
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              children: [
                ..._buildDifficultyIcons(recipe?.difficulty ?? 0),
                SizedBox(width: 5),
                Text(
                  recipe?.difficulty == 1
                      ? 'Easy'
                      : recipe?.difficulty == 2
                      ? 'Medium'
                      : recipe?.difficulty == 3
                      ? 'Hard'
                      : "N/A",
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
    );
  }

  Container _buildDescriptionSection(String? description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.edit, color: AppColors.primaryColor),
              SizedBox(width: 5),
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
            description ?? 'No Description',
            style: TextStyle(
              fontSize: AppTextStyles.bodyBig.fontSize,
              color: Colors.black,
              fontFamily: AppFonts.primaryFont,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildIngredientsSection(List<String>? ingredientsList) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primaryColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.emoji_food_beverage_rounded, color: Colors.white),
              SizedBox(width: 5),
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
            child: _listToColumnStyler(ingredientsList ?? [], Colors.white),
          ),
        ],
      ),
    );
  }

  Container _buildNutritionSection() {
    return Container(
      height: 76,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
                Text(
                  "Protein",
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontWeight: FontWeight.w900,
                    fontSize: AppTextStyles.subTitle.fontSize,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.emoji_food_beverage_rounded,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${recipe?.nutrition?['protein']}g',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppTextStyles.subTitle.fontSize,
                        fontFamily: AppFonts.primaryFont,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
                Text(
                  "Carbs",
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontWeight: FontWeight.w900,
                    fontSize: AppTextStyles.subTitle.fontSize,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.emoji_food_beverage_rounded,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${recipe?.nutrition?['carbs']}g',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppTextStyles.subTitle.fontSize,
                        fontFamily: AppFonts.primaryFont,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
                Text(
                  "Fibre",
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontWeight: FontWeight.w900,
                    fontSize: AppTextStyles.subTitle.fontSize,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.emoji_food_beverage_rounded,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${recipe?.nutrition?['fibre']}g',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppTextStyles.subTitle.fontSize,
                        fontFamily: AppFonts.primaryFont,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
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

List<Icon> _buildDifficultyIcons(int difficulty) {
  return List.generate(difficulty, (index) {
    return Icon(
      Icons.emoji_food_beverage_rounded,
      color: AppColors.primaryColor,
    );
  });
}

Column _listToColumnStyler(List<String>? items, Color color) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
        items?.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              item,
              style: TextStyle(
                color: color,
                fontFamily: AppFonts.primaryFont,
                fontSize: AppTextStyles.bodyBig.fontSize,
              ),
            ),
          );
        }).toList() ??
        [],
  );
}
