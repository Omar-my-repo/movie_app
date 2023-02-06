// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalMovieModelAdapter extends TypeAdapter<LocalMovieModel> {
  @override
  final int typeId = 1;

  @override
  LocalMovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalMovieModel(
      fields[0] as num,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalMovieModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalMovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
