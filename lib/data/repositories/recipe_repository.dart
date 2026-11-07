import 'package:dio/dio.dart';

import '../models/recipe_model.dart';

class RecipeRepository {
  final Dio _dio = Dio();

  Future<List<RecipeModel>> fetchRecipes() async {
    try {
      final response = await _dio.get('https://dummyjson.com/recipes');
      final List rawRecipes = response.data['recipes'];
      return rawRecipes.map((json) => RecipeModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load data from server: $e');
    }
  }
}
