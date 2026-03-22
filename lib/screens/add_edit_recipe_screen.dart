import 'package:flutter/material.dart';
import 'dart:math';
import '../models/recipe.dart';
import '../models/ingredient.dart';
import '../services/hive_service.dart';

class AddEditRecipeScreen extends StatefulWidget {
  const AddEditRecipeScreen({super.key});

  @override
  State<AddEditRecipeScreen> createState() => _AddEditRecipeScreenState();
}

class _AddEditRecipeScreenState extends State<AddEditRecipeScreen> {
  final name = TextEditingController();
  final desc = TextEditingController();

  List<Ingredient> ingredients = [];
  List<String> steps = [];

  // controllers
  final ingName = TextEditingController();
  final ingQty = TextEditingController();
  final ingUnit = TextEditingController();

  final stepController = TextEditingController();

  void addIngredient() {
    if (ingName.text.isEmpty || ingQty.text.isEmpty) return;

    setState(() {
      ingredients.add(Ingredient()
        ..name = ingName.text
        ..quantity = double.tryParse(ingQty.text) ?? 0
        ..unit = ingUnit.text);
    });

    ingName.clear();
    ingQty.clear();
    ingUnit.clear();
  }

  void addStep() {
    if (stepController.text.isEmpty) return;

    setState(() {
      steps.add(stepController.text);
    });

    stepController.clear();
  }

  void saveRecipe() {
    if (name.text.isEmpty) return;

    final r = Recipe()
      ..id = Random().nextInt(999999).toString()
      ..name = name.text
      ..description = desc.text
      ..ingredients = ingredients
      ..steps = steps
      ..prepTimeMinutes = 10
      ..cookTimeMinutes = 10
      ..servings = 1
      ..category = "General"
      ..cuisine = "Any"
      ..tags = []
      ..rating = 0
      ..isFavorite = false
      ..createdAt = DateTime.now();

    HiveService.add(r);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Recipe")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// NAME
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: "Recipe Name"),
            ),

            /// DESCRIPTION
            TextField(
              controller: desc,
              decoration: const InputDecoration(labelText: "Description"),
            ),

            const SizedBox(height: 20),

            /// INGREDIENTS
            const Text("Ingredients", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: ingName,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: ingQty,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Qty"),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: ingUnit,
                    decoration: const InputDecoration(labelText: "Unit"),
                  ),
                ),
                IconButton(
                  onPressed: addIngredient,
                  icon: const Icon(Icons.add),
                )
              ],
            ),

            /// LIST
            ...ingredients.asMap().entries.map((e) {
              return ListTile(
                title: Text("${e.value.name} (${e.value.quantity} ${e.value.unit})"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      ingredients.removeAt(e.key);
                    });
                  },
                ),
              );
            }),

            const SizedBox(height: 20),

            /// STEPS
            const Text("Steps", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: stepController,
                    decoration: const InputDecoration(labelText: "Step"),
                  ),
                ),
                IconButton(
                  onPressed: addStep,
                  icon: const Icon(Icons.add),
                )
              ],
            ),

            /// LIST
            ...steps.asMap().entries.map((e) {
              return ListTile(
                title: Text("${e.key + 1}. ${e.value}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      steps.removeAt(e.key);
                    });
                  },
                ),
              );
            }),

            const SizedBox(height: 30),

            /// SAVE BUTTON
            Center(
              child: ElevatedButton(
                onPressed: saveRecipe,
                child: const Text("Save Recipe"),
              ),
            )
          ],
        ),
      ),
    );
  }
}