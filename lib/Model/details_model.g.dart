// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailsModelAdapter extends TypeAdapter<DetailsModel> {
  @override
  final int typeId = 0;

  @override
  DetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailsModel(
      price: fields[0] as String,
      onNetMints: fields[1] as String,
      ofNetMints: fields[2] as String,
      mb: fields[3] as String,
      socialMB: fields[4] as String,
      sMS: fields[5] as String,
      activationCode: fields[6] as String,
      deactivationCode: fields[7] as String,
      shareImage: fields[8] as String,
      sipCallImage: fields[9] as String,
      copyImage: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DetailsModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.onNetMints)
      ..writeByte(2)
      ..write(obj.ofNetMints)
      ..writeByte(3)
      ..write(obj.mb)
      ..writeByte(4)
      ..write(obj.socialMB)
      ..writeByte(5)
      ..write(obj.sMS)
      ..writeByte(6)
      ..write(obj.activationCode)
      ..writeByte(7)
      ..write(obj.deactivationCode)
      ..writeByte(8)
      ..write(obj.shareImage)
      ..writeByte(9)
      ..write(obj.sipCallImage)
      ..writeByte(10)
      ..write(obj.copyImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
