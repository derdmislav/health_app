// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_count.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StepCountAdapter extends TypeAdapter<StepCount> {
  @override
  final int typeId = 0;

  @override
  StepCount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StepCount(
      steps: fields[1] as int,
      dateTime: fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, StepCount obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.steps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepCountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
