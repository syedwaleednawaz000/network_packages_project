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
      packageName: fields[0] as String,
      price: fields[1] as String,
      onNetMints: fields[2] as String,
      ofNetMints: fields[3] as String,
      mb: fields[4] as String,
      socialMB: fields[5] as String,
      sMS: fields[6] as String,
      activationCode: fields[7] as String,
      deactivationCode: fields[8] as String,
      companyImage: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DetailsModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.packageName)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.onNetMints)
      ..writeByte(3)
      ..write(obj.ofNetMints)
      ..writeByte(4)
      ..write(obj.mb)
      ..writeByte(5)
      ..write(obj.socialMB)
      ..writeByte(6)
      ..write(obj.sMS)
      ..writeByte(7)
      ..write(obj.activationCode)
      ..writeByte(8)
      ..write(obj.deactivationCode)
      ..writeByte(9)
      ..write(obj.companyImage);
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
