import 'package:flutter/material.dart';
import 'dart:math';
import '../models/recipe.dart';
import '../models/ingredient.dart';
import '../services/hive_service.dart';

class AddEditRecipeScreen extends StatelessWidget {
  AddEditRecipeScreen({super.key});

  final name = TextEditingController();
  final desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Recipe")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(controller: name, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: desc, decoration: InputDecoration(labelText: "Description")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final r = Recipe()
                  ..id = Random().nextInt(999999).toString()
                  ..name = name.text
                  ..description = desc.text
                  ..ingredients = []
                  ..steps = []
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
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}