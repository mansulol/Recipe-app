class RecipeModel {
  final String id;
  final String name;
  final String description;
  final List<String> ingredients;
  final List<String> preparation;
  final Map<String, double> nutrition;
  final int servingMin;
  final int servingMax;
  final int cookTime;
  final int dificulty;

  RecipeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.preparation,
    required this.nutrition,
    required this.servingMin,
    required this.servingMax,
    required this.cookTime,
    required this.dificulty
  });

  factory RecipeModel.fromJson( Map<String, dynamic> json ) {
    return RecipeModel(
      id: json['_id'], 
      name: json['name'], 
      description: json['description'], 
      ingredients: List<String>.from(json['ingredients']), 
      preparation: List<String>.from(json['preparation']), 
      nutrition: Map<String, double>.from(json['nutrition']),
      servingMin: json['serving']['min'], 
      servingMax: json['serving']['max'], 
      cookTime: json['cookTime'],
      dificulty: json['dificulty']
      );
  }

  Map<String, dynamic> toJson(){

    return {
      '_id': 1,
      'name': name,
      'description': description,
      'ingredients': ingredients,
      'preparation': preparation,
      'nutrition': nutrition,
      'serving': { 'min': servingMin, 'max': servingMax },
      'cookTime': cookTime,
      'dificulty': dificulty
    };
  }
}