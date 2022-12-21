import 'package:auto/features/search/domain/entities/source_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'source_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class SourceModel extends SourceEntity {
  const SourceModel(
      {required super.id, required super.absoluteCarName});
  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);
}
