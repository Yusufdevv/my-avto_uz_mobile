import 'package:auto/features/ad/domain/entities/damaged_part/damaged_part.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'damaged_part.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DamagedPartModel extends DamagedPartEntity {
  const DamagedPartModel({
    required super.part,
    required super.damageType,
  });

  factory DamagedPartModel.fromJson(Map<String, dynamic> json) =>
      _$DamagedPartModelFromJson(json);
}
