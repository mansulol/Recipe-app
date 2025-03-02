import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_card_model.dart';
import 'package:recipe_app/services/recipe_service.dart';
import 'package:recipe_app/utils/constants.dart';
import 'package:recipe_app/widgets/custom_card_recipe.dart';
// import 'package:recipe_app/utils/constants.dart';
import 'package:recipe_app/widgets/custom_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Recipe App",
          style: TextStyle(
            fontSize: AppTextStyles.titleApp.fontSize,
            fontFamily: AppTextStyles.title.fontFamily,
            fontWeight: FontWeight.w900,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          CustomSearchBar(),
          Expanded(
            child: FutureBuilder<List<RecipeCardModel>>(
              future: RecipeService().getAllRecipes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final recipes = snapshot.data!;
                  return ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      return CustomCardRecipe(recipes[index]);
                    },
                  );
                } else {
                  return Center(child: Text('No data'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}