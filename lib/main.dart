import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/recipe_repository.dart';
import 'logic/bloc/recipe_bloc.dart';
import 'logic/bloc/recipe_event.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(primarySwatch: Colors.orange, useMaterial3: true),
      home: BlocProvider(
        create: (context) =>
            RecipeBloc(RecipeRepository())..add(FetchRecipesEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}
