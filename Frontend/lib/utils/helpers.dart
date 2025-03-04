import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';

class FormControllers {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController servingController = TextEditingController();
  final TextEditingController cookTimeController = TextEditingController();
  final TextEditingController difficultyController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController preparationController = TextEditingController();
  final TextEditingController proteinController = TextEditingController();
  final TextEditingController carbsController = TextEditingController();
  final TextEditingController fibreController = TextEditingController();

  FormControllers();

  // Free resources
  void clear() {
    nameController.clear();
    descriptionController.clear();
    servingController.clear();
    cookTimeController.clear();
    difficultyController.clear();
    ingredientsController.clear();
    preparationController.clear();
    proteinController.clear();
    carbsController.clear();
    fibreController.clear();
  }

  void loadFormControllers(RecipeModel? recipe) {
  if (recipe != null) {
    nameController.text = recipe.name ?? '';
    descriptionController.text = recipe.description ?? '';
    servingController.text =
        '${recipe.servingMin} - ${recipe.servingMax}';
    cookTimeController.text = recipe.cookTime.toString();
    difficultyController.text = recipe.difficulty.toString();
    ingredientsController.text =
        recipe.ingredients?.join(', ') ?? '';
    preparationController.text =
        recipe.preparation?.join(', ') ?? '';
    proteinController.text =
        recipe.nutrition?['protein']?.toString() ?? '';
    carbsController.text =
        recipe.nutrition?['carbs']?.toString() ?? '';
    fibreController.text =
        recipe.nutrition?['fibre']?.toString() ?? '';
  } else {
    nameController.text = '';
    descriptionController.text = '';
    servingController.text = '';
    cookTimeController.text = '';
    difficultyController.text = '';
    ingredientsController.text = '';
    preparationController.text = '';
    proteinController.text = '';
    carbsController.text = '';
    fibreController.text = '';
  }
}

}
