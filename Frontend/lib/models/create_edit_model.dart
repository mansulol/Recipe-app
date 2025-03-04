import 'dart:convert';

class CreateEditModel {
  late String _name;
  late String _description;
  late int _minServing;
  late int _maxServing;
  late int _cookingTime;
  late int _difficulty;
  late List<String> _ingredients;
  late List<String> _preparation;
  late Map<String, double> _nutrition;

  CreateEditModel() {
    _name = '';
    _description = '';
    _ingredients = [];
    _preparation = [];
    _minServing = 0;
    _maxServing = 0;
    _cookingTime = 0;
    _difficulty = 0;
    _nutrition = {};
  }

  set name(String nameString) {
    _name = nameString;
  }

  set description(String descriptionString) {
    _description = descriptionString;
  }

  set cookTime(int cookTime) {
    _cookingTime = cookTime;
  }

  String get name => _name;
  String get description => _description;
  List<String> get ingredients => _ingredients;
  List<String> get preparation => _preparation;
  String get serving => '$_minServing - $_maxServing';
  int get cookTime => _cookingTime;
  int get difficulty => _difficulty;
  Map<String, double> get nutrition => _nutrition;

  void servingConverter(String rawServing) {
    var listServing = rawServing.split('-');
    _minServing = int.parse(listServing[0].trim());
    _maxServing = int.parse(listServing[1].trim());
  }

  void dificultConverter(String rawDificulty) {
    if (rawDificulty.toLowerCase() == 'hard') {
      _difficulty = 3;
    } else if (rawDificulty.toLowerCase() == 'medium') {
      _difficulty = 2;
    } else {
      _difficulty = 1;
    }
  }

  void ingredientsConverter(String rawIngredients) {
    _ingredients.addAll(
      rawIngredients.split(',').map((ingredient) {
        return '${ingredient.trim()[0].toUpperCase()}${ingredient.trim().substring(1)}';
      }).toList(),
    );
  }

  void preparationConverter(String rawPreparation) {
    _preparation.addAll(
      rawPreparation.split(',').map((preparation) {
        return '${preparation.trim()[0].toUpperCase()}${preparation.trim().substring(1)}';
      }).toList(),
    );
  }

  void nutritionConverter(String rawProtein, String rawCarbs, String rawFibre) {
    double parseNutrient(String rawValue) {
      if (rawValue.contains('g')) {
        return double.parse(
          rawProtein.trim().substring(0, rawProtein.indexOf('g')),
        );
      } else {
        return double.parse(rawProtein.trim());
      }
    }

    final nutritionValue = <String, double>{
      "protein": parseNutrient(rawProtein),
      'carbs': parseNutrient(rawCarbs),
      'fibre': parseNutrient(rawFibre),
    };
    _nutrition.addAll(nutritionValue);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": _name,
      "description": _description,
      "ingredients": _ingredients,
      "preparation": _preparation,
      "serving": {"min": _minServing, "max": _maxServing},
      "cookTime": _cookingTime,
      "difficulty": _difficulty,
      "nutrition": _nutrition,
    };
  }
}
