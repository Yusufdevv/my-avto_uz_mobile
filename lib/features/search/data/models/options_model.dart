import 'package:auto/features/search/domain/entities/search_suggest_entity.dart';
import 'package:auto/features/search/data/models/source_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'options_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OptionsModel extends OptionsEntity {
  const OptionsModel(
      {required super.source, required super.text});
  factory OptionsModel.fromJson(Map<String, dynamic> json) =>
      _$OptionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$OptionsModelToJson(this);
}
