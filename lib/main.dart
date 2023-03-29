import 'package:flutter/material.dart';
import 'recipe_page.dart';
import 'recipe.dart';

List<String> ing = ['4 Eggs', '80g Oats', '1 Banana', '1tsp Vanilla Essence', '1tbsp Milk'];
List<String> steps = ['Put banana in blender', 'Pour in oats', 'Crack eggs and put', 'Add Vanilla Essence', 'Add Milk', 'Blend the Mixture', 'Cook Mixture on low heat'];
Recipe recipe = Recipe('Sweet Pancakes', 'Tasty', ing, steps);


void main() => runApp(RecipeBox());

class RecipeBox extends StatelessWidget {
  const RecipeBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: RecipePage(recipe.ingredients, recipe.name, recipe.steps, recipe.bywho),
    );
  }
}
