import 'package:flutter/material.dart';

class MealPlannerScreen extends StatelessWidget {
  const MealPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meal Planner")),
      body: Center(
        child: Text("Simple planner (can be expanded)"),
      ),
    );
  }
}