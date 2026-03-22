import 'package:hive/hive.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 1)
class Ingredient {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late double quantity;

  @HiveField(2)
  late String unit;
}