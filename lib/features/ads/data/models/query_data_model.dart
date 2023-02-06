import 'package:auto/features/ads/domain/entities/query_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'query_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QueryDataModel extends QueryDataEntity {
  const QueryDataModel({
    required super.bodyType,
    required super.driveType,
    required super.gearboxType,
    required super.engineType,
    required super.isNew,
    required super.priceFrom,
    required super.priceTo,
    required super.regionIn,
    required super.yearFrom,
    required super.yearTo,
  });

  factory QueryDataModel.fromJson(Map<String, dynamic> json) =>
      _$QueryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$QueryDataModelToJson(this);
}
