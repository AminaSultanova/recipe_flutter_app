import 'package:equatable/equatable.dart';

import '../../data/models/recipe_model.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object?> get props => [];
}

class RecipeInitialState extends RecipeState {}

class RecipeLoadingState extends RecipeState {}

class RecipeLoadedState extends RecipeState {
  final List<RecipeModel> recipes;

  const RecipeLoadedState(this.recipes);

  @override
  List<Object?> get props => [recipes];
}

class RecipeErrorState extends RecipeState {
  final String message;

  const RecipeErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
