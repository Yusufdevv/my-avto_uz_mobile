import 'package:auto/features/comparison/domain/entities/announcement_entity.dart';
import 'package:auto/features/comparison/domain/entities/comparison_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comparison_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ComparisonModel extends ComparisonEntity {
  const ComparisonModel({
    required super.id,
    required super.announcement,
    required super.order,
  });

  factory ComparisonModel.fromJson(Map<String, dynamic> json) =>
      _$ComparisonModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComparisonModelToJson(this);
}
