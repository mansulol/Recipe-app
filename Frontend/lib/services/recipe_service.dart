import 'package:http/http.dart' as http;
import 'package:recipe_app/models/create_edit_model.dart';
import 'dart:convert';
import '../models/recipe_model.dart';
import '../models/recipe_card_model.dart';

class RecipeService {
  final String endPoint = 'http://10.0.2.2:8080/api/recipes';

  Future<List<RecipeCardModel>> getAllRecipes() async {
    final response = await http.get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => RecipeCardModel.fromJson(json)).toList();
    } else {
      throw Exception('Error while retrieving recipes');
    }
  }

  Future<RecipeModel> getOneRecipe(String id) async {
    final response = await http.get(Uri.parse('$endPoint/$id'));

    if (response.statusCode == 200) {
      return RecipeModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error while retrieving recipes');
    }
  }

   Future<RecipeModel> createRecipe(CreateEditModel model) async {
    final response = await http.post(
      Uri.parse(endPoint),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(model.toJson()),
    );

    if (response.statusCode == 201) {
      return RecipeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create recipe: ${response.body}');
    }
  }

  Future<RecipeModel> updateRecipe(String id, CreateEditModel model) async {
    final response = await http.put(
      Uri.parse('$endPoint/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(model.toJson()),
    );

    if (response.statusCode == 200) {
      return RecipeModel.fromJson(json.decode(response.body));
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
