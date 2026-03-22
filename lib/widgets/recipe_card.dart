import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;

  const RecipeCard({super.key, required this.recipe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(recipe.name, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("${recipe.prepTimeMinutes + recipe.cookTimeMinutes} min"),
          ],
        ),
      ),
    );
  }
}