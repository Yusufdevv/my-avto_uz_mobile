import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ads/domain/entities/query_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'query_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QueryDataModel extends QueryDataEntity {
  const QueryDataModel({
    super.bodyType,
    super.driveType,
    super.gearboxType,
    super.engineType,
    super.isNew,
    super.priceFrom,
    super.priceTo,
    super.regionIn,
    super.yearFrom,
    super.yearTo,
    super.currency,
  });

  factory QueryDataModel.fromJson(Map<String, dynamic> json) =>
      _$QueryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$QueryDataModelToJson(this);
}
