import 'package:auto/features/common/models/color_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorEntity extends Equatable {
  final int id;
  final String name;
  final String hexCode;

  const ColorEntity({this.id = -1, this.name = '', this.hexCode = ''});

  @override
  List<Object?> get props => [
        id,
        name,
        hexCode,
      ];
}
class ColorConverter
    implements JsonConverter<ColorEntity, Map<String, dynamic>?> {
  const ColorConverter();

  @override
  ColorEntity fromJson(Map<String, dynamic>? json) =>
      ColorModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(ColorEntity object) => {};
}