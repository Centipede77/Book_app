// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe()
      ..id = fields[0] as String
      ..name = fields[1] as String
      ..description = fields[2] as String
      ..ingredients = (fields[3] as List).cast<Ingredient>()
      ..steps = (fields[4] as List).cast<String>()
      ..prepTimeMinutes = fields[5] as int
      ..cookTimeMinutes = fields[6] as int
      ..servings = fields[7] as int
      ..category = fields[8] as String
      ..cuisine = fields[9] as String
      ..tags = (fields[10] as List).cast<String>()
      ..imageUrl = fields[11] as String?
      ..rating = fields[12] as double
      ..isFavorite = fields[13] as bool
      ..createdAt = fields[14] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.ingredients)
      ..writeByte(4)
      ..write(obj.steps)
      ..writeByte(5)
      ..write(obj.prepTimeMinutes)
      ..writeByte(6)
      ..write(obj.cookTimeMinutes)
      ..writeByte(7)
      ..write(obj.servings)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.cuisine)
      ..writeByte(10)
      ..write(obj.tags)
      ..writeByte(11)
      ..write(obj.imageUrl)
      ..writeByte(12)
      ..write(obj.rating)
      ..writeByte(13)
      ..write(obj.isFavorite)
      ..writeByte(14)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
