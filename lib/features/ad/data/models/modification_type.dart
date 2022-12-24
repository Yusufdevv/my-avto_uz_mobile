import 'package:auto/features/ad/domain/entities/types/modification_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'modification_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ModificationTypeModel extends ModificationTypeEntity {
  const ModificationTypeModel({
    required super.id,
    required super.power,
    required super.volume,
  });

  factory ModificationTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ModificationTypeModelFromJson(json);
}
