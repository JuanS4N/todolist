// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_hive_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveListObjectAdapter extends TypeAdapter<HiveListObject> {
  @override
  final int typeId = 0;

  @override
  HiveListObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveListObject(
      fields[0] as String,
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveListObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.listName)
      ..writeByte(1)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveListObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
