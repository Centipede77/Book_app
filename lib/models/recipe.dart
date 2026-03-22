import 'package:hive/hive.dart';
import 'ingredient.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late List<Ingredient> ingredients;

  @HiveField(4)
  late List<String> steps;

  @HiveField(5)
  late int prepTimeMinutes;

  @HiveField(6)
  late int cookTimeMinutes;

  @HiveField(7)
  late int servings;

  @HiveField(8)
  late String category;

  @HiveField(9)
  late String cuisine;

  @HiveField(10)
  late List<String> tags;

  @HiveField(11)
  String? imageUrl;

  @HiveField(12)
  late double rating;

  @HiveField(13)
  late bool isFavorite;

  @HiveField(14)
  late DateTime createdAt;
}