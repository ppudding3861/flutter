// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BurgerFavoriteItem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BurgerFavoriteItemAdapter extends TypeAdapter<BurgerFavoriteItem> {
  @override
  final int typeId = 1;

  @override
  BurgerFavoriteItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BurgerFavoriteItem(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BurgerFavoriteItem obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.index);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BurgerFavoriteItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
