import 'package:auto/features/search/domain/entities/option_entity.dart';
import 'package:auto/features/search/domain/entities/source_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'option_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class OptionModel extends OptionEntity {
  const OptionModel({
    required super.id,
    required super.index,
    required super.score,
    required super.source,
    required super.text,
    required super.type,
  });
  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionModelToJson(this);
}
