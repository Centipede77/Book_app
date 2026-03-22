import 'package:hive_flutter/hive_flutter.dart';
import '../models/recipe.dart';
import '../models/ingredient.dart';

class HiveService {
  static const boxName = 'recipes';

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(RecipeAdapter());
    Hive.registerAdapter(IngredientAdapter());

    await Hive.openBox<Recipe>(boxName);
  }

  static Box<Recipe> get box => Hive.box<Recipe>(boxName);

  static List<Recipe> getAll() => box.values.toList();

  static Future<void> add(Recipe r) async {
    await box.put(r.id, r);
  }

  static void delete(String id) {
    box.delete(id);
  }

  static void toggleFavorite(Recipe r) {
    r.isFavorite = !r.isFavorite;
    r.save();
  }

  static List<Recipe> search(String query) {
    return box.values
        .where((r) => r.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  static Map<String, double> shopping(List<Recipe> recipes) {
    final map = <String, double>{};

    for (var r in recipes) {
      for (var i in r.ingredients) {
        map[i.name] = (map[i.name] ?? 0) + i.quantity;
      }
    }

    return map;
  }
}