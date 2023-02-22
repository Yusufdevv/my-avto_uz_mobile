import 'package:auto/features/ads/domain/entities/query_data_entity.dart';
import 'package:auto/features/ads/domain/entities/save_filter_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_filter_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SaveFilterModel extends SaveFilterEntity {
  const SaveFilterModel({
    super.make,
    super.model,
    super.query,
    super.queryData,
    super.id,
  });

  factory SaveFilterModel.fromJson(Map<String, dynamic> json) =>
      _$SaveFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveFilterModelToJson(this);

  @override
  List<Object?> get props => [make, model, query, queryData, id];
}
