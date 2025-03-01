import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/recipe_model.dart';
import '../models/recipe_card_model.dart';

class RecipeService {
  final String endPoint = 'http://localhost:8080/api/recipes';

  Future<List<RecipeCardModel>> getAllRecipes() async {
    final response = await http.get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => RecipeCardModel.fromJson(json)).toList();
    } else {
      throw Exception('Error while retrieving recipes');
    }
  }

  Future<List<RecipeModel>> getOneRecipe(String id) async {
    final response = await http.get(Uri.parse('$endPoint/$id'));
    
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => RecipeModel.fromJson(json)).toList();
    } else {
      throw Exception('Error while retrieving recipes');
    }
  }

  Future<List<RecipeModel>> createRecipe(Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse(endPoint), body: data);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => RecipeModel.fromJson(json)).toList();
    } else {
      throw Exception('Error while retrieving recipes');
    }
  }

  Future<List<RecipeModel>> updateRecipe(
    String id,
    Map<String, dynamic> data,
  ) async {
    final response = await http.put(Uri.parse('$endPoint/$id'), body: data);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => RecipeModel.fromJson(json)).toList();
    } else {
      throw Exception('Error while retrieving recipes');
    }
  }

  Future<List<RecipeModel>> deleteRecipe(String id) async {
    final response = await http.delete(Uri.parse('$endPoint/$id'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => RecipeModel.fromJson(json)).toList();
    } else {
      throw Exception('Error while retrieving recipes');
    }
  }
}
