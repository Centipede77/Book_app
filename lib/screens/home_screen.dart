import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/recipe.dart';
import '../services/hive_service.dart';
import '../widgets/recipe_card.dart';
import 'add_edit_recipe_screen.dart';
import 'recipe_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipes")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddEditRecipeScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveService.box.listenable(),
        builder: (context, box, _) {
          List<Recipe> recipes = box.values.toList();

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(labelText: "Search"),
                  onChanged: (_) => (context as Element).markNeedsBuild(),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: recipes.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (_, i) {
                    final r = recipes[i];

                    if (!r.name
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())) {
                      return SizedBox();
                    }

                    return RecipeCard(
                      recipe: r,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => RecipeDetailsScreen(recipe: r)),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}