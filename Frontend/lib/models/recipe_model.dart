class RecipeModel {
  final String? id;
  final String? name;
  final String? description;
  final List<String>? ingredients;
  final List<String>? preparation;
  final Map<String, dynamic>? nutrition;
  final int? servingMin;
  final int? servingMax;
  final int? cookTime;
  final int? difficulty;

  RecipeModel({
    this.id,
    this.name,
    this.description,
    this.ingredients,
    this.preparation,
    this.nutrition,
    this.servingMin,
    this.servingMax,
    this.cookTime,
    this.difficulty
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients'] ?? []),
      preparation: List<String>.from(json['preparation'] ?? []),
      nutrition: Map<String, dynamic>.from(json['nutrition'] ?? []),
      servingMin: json['serving']['min'] as int?,
      servingMax: json['serving']['max'] as int?,
      cookTime: json['cookTime'] as int?,
      difficulty: json['difficulty'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'ingredients': ingredients,
      'preparation': preparation,
      'nutrition': nutrition,
      'serving': {'min': servingMin, 'max': servingMax},
      'cookTime': cookTime,
      'difficulty': difficulty,
    };
  }
}