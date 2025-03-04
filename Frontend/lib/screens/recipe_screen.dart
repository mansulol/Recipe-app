import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/services/recipe_service.dart';
import 'package:recipe_app/utils/constants.dart';

class RecipeScreen extends StatefulWidget {
  final String idRecipe;
  const RecipeScreen(this.idRecipe, {super.key});

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
    loadRecipe(widget.idRecipe);
  }

  Future<void> loadRecipe(idRecipe) async {
    try {
      final data = await RecipeService().getOneRecipe(idRecipe);
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Container(
                width: 60,
                height: 25,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green, // Color de fondo
                  borderRadius: BorderRadius.circular(5), // Bordes redondeados
                ),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
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
              FaIcon(
                FontAwesomeIcons.bowlFood,
                size: 20,
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
          _listToColumnStyler(preparationList ?? [], Colors.black, true),
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
                FaIcon(
                  FontAwesomeIcons.utensils,
                  size: 20,
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
                FaIcon(
                  FontAwesomeIcons.clock,
                  size: 20,
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
          SizedBox(
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.start,
              description ?? 'No Description',
              style: TextStyle(
                fontSize: AppTextStyles.bodyBig.fontSize,
                color: Colors.black,
                fontFamily: AppFonts.primaryFont,
              ),
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
              FaIcon(
                FontAwesomeIcons.appleWhole,
                size: 20,
                color: Colors.white,
              ),
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
            child: _listToColumnStyler(
              ingredientsList ?? [],
              Colors.white,
              false,
            ),
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
                    FaIcon(
                      FontAwesomeIcons.drumstickBite,
                      size: 30,
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
                    FaIcon(
                      FontAwesomeIcons.bowlRice,
                      size: 30,
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
                    FaIcon(
                      FontAwesomeIcons.leaf,
                      size: 30,
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

List<FaIcon> _buildDifficultyIcons(int difficulty) {
  return List.generate(3, (index) {
    final color =
        index < difficulty ? AppColors.primaryColor : AppColors.gray10;

    return FaIcon(FontAwesomeIcons.carrot, size: 20, color: color);
  });
}

Column _listToColumnStyler(List<String>? items, Color color, bool ordered) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
        items?.map((item) {
          // Convertir la lista en un mapa indexado
          final indexedItems = items.asMap();

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            child: Text(
              // Si ordered es true, añadir el índice al texto
              ordered
                  ? '${indexedItems.keys.toList()[items.indexOf(item)] + 1}. $item'
                  : item,
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
