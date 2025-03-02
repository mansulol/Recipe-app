class RecipeCardModel {
  final String? id;
  final String? name;
  final Map<String, dynamic>? nutrition;
  final int? servingMax;
  final int? cookTime;

  RecipeCardModel({
    required this.id,
    required this.name,
    required this.nutrition,
    required this.servingMax,
    required this.cookTime,
  });

  factory RecipeCardModel.fromJson( Map<String, dynamic> json ) {
    return RecipeCardModel(
      id: json['_id'], 
      name: json['name'], 
      nutrition: Map<String, dynamic>.from(json['nutrition'] ?? []),
      servingMax: json['serving']['max'] as int?, 
      cookTime: json['cookTime'] as int?,
      );
  }

  Map<String, dynamic> toJson(){

    return {
      '_id': 1,
      'name': name,
      'nutrition': nutrition,
      'serving': servingMax,
      'cookTime': cookTime,
    };
  }
}