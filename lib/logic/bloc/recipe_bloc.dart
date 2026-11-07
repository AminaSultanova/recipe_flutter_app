import 'package:flutter_bloc/flutter_bloc.dart';

import 'recipe_event.dart';
import 'recipe_state.dart';
import '../../data/models/recipe_model.dart';
import '../../data/repositories/recipe_repository.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository repository;
  List<RecipeModel> _allRecipes = [];

  RecipeBloc(this.repository) : super(RecipeInitialState()) {
    on<FetchRecipesEvent>((event, emit) async {
      emit(RecipeLoadingState());
      try {
        _allRecipes = await repository.fetchRecipes();
        emit(RecipeLoadedState(_allRecipes));
      } catch (e) {
        emit(RecipeErrorState(e.toString()));
      }
    });

    on<SearchRecipesEvent>((event, emit) {
      if (event.query.isEmpty) {
        emit(RecipeLoadedState(_allRecipes));
      } else {
        final filtered = _allRecipes.where((recipe) {
          final queryLower = event.query.toLowerCase();
          final nameMatches = recipe.name.toLowerCase().contains(queryLower);
          final cuisineMatches = recipe.cuisine.toLowerCase().contains(
            queryLower,
          );
          return nameMatches || cuisineMatches;
        }).toList();
        emit(RecipeLoadedState(filtered));
      }
    });
  }
}
