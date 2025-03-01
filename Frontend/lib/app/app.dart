import 'package:flutter/material.dart';
// import 'package:recipe_app/screens/create_edit_screen.dart';
// import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/recipe_screen.dart';

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Recipe App',
      home: Scaffold(
        body: Center(
          child: RecipeScreen(),
        ),
      ),
    );
  }
}