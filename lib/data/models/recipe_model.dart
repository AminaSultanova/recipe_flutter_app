class RecipeModel {
  final int id;
  final String name;
  final String cuisine;
  final String image;
  final double rating;
  final int prepTimeMinutes;
  final List<String> ingredients;
  final List<String> instructions;

  RecipeModel({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.image,
    required this.rating,
    required this.prepTimeMinutes,
    required this.ingredients,
    required this.instructions,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      cuisine: json['cuisine'] ?? '',
      image: json['image'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      prepTimeMinutes: json['prepTimeMinutes'] ?? 0,
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
    );
  }
}
