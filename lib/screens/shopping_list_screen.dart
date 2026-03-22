import 'package:flutter/material.dart';
import '../services/hive_service.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = HiveService.getAll();
    final list = HiveService.shopping(recipes);

    return Scaffold(
      appBar: AppBar(title: Text("Shopping List")),
      body: ListView(
        children: list.entries
            .map((e) => CheckboxListTile(
                  value: false,
                  onChanged: (_) {},
                  title: Text(e.key),
                  subtitle: Text(e.value.toString()),
                ))
            .toList(),
      ),
    );
  }
}