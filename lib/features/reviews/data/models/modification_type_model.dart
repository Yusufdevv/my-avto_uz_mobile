import 'package:auto/features/reviews/domain/entities/modification_type_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'modification_type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ModificationTypeModel extends ModificationTypeEntity {
  ModificationTypeModel({
    required super.id,
    required super.power,
    required super.volume,
  });

  factory ModificationTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ModificationTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModificationTypeModelToJson(this);
}
