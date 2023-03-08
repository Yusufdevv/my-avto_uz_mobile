import 'package:auto/features/common/entities/color_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'color_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class ColorModel extends ColorEntity {
  const ColorModel({
    required super.hexCode,
    required super.id,
    required super.name,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);
}
