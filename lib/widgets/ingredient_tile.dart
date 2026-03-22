import 'package:flutter/material.dart';
import '../models/ingredient.dart';

class IngredientTile extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientTile({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ingredient.name),
      trailing: Text("${ingredient.quantity} ${ingredient.unit}"),
    );
  }
}