// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodAdapter extends TypeAdapter<Food> {
  @override
  final int typeId = 2;

  @override
  Food read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Food(
      id: fields[1] as int,
      description: fields[2] as String,
      dataType: fields[4] as String,
      energy: fields[7] as String,
    )
      ..dateTime = fields[0] as DateTime
      ..carbohydrate = fields[3] as String
      ..protein = fields[5] as String
      ..totalLipid = fields[6] as String
      ..vitaminA = fields[8] as String
      ..vitaminD = fields[9] as String
      ..calcium = fields[10] as String
      ..iron = fields[11] as String
      ..vitaminC = fields[12] as String
      ..sugarsTotal = fields[13] as String
      ..fiber = fields[14] as String
      ..sodium = fields[15] as String
      ..cholesterol = fields[16] as String
      ..fattyAcidsTrans = fields[17] as String
      ..fattyAcidsSat = fields[18] as String;
  }

  @override
  void write(BinaryWriter writer, Food obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.carbohydrate)
      ..writeByte(4)
      ..write(obj.dataType)
      ..writeByte(5)
      ..write(obj.protein)
      ..writeByte(6)
      ..write(obj.totalLipid)
      ..writeByte(7)
      ..write(obj.energy)
      ..writeByte(8)
      ..write(obj.vitaminA)
      ..writeByte(9)
      ..write(obj.vitaminD)
      ..writeByte(10)
      ..write(obj.calcium)
      ..writeByte(11)
      ..write(obj.iron)
      ..writeByte(12)
      ..write(obj.vitaminC)
      ..writeByte(13)
      ..write(obj.sugarsTotal)
      ..writeByte(14)
      ..write(obj.fiber)
      ..writeByte(15)
      ..write(obj.sodium)
      ..writeByte(16)
      ..write(obj.cholesterol)
      ..writeByte(17)
      ..write(obj.fattyAcidsTrans)
      ..writeByte(18)
      ..write(obj.fattyAcidsSat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
