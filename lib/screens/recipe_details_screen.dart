import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/hive_service.dart';
import '../widgets/ingredient_tile.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        actions: [
          IconButton(
            icon: Icon(recipe.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              HiveService.toggleFavorite(recipe);
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text(recipe.description),
          SizedBox(height: 10),
          Text("Ingredients", style: TextStyle(fontWeight: FontWeight.bold)),
          ...recipe.ingredients.map((e) => IngredientTile(ingredient: e)),
          SizedBox(height: 10),
          Text("Steps", style: TextStyle(fontWeight: FontWeight.bold)),
          ...recipe.steps
              .asMap()
              .entries
              .map((e) => Text("${e.key + 1}. ${e.value}")),
        ],
      ),
    );
  }
}