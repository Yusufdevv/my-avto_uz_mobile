import 'package:auto/features/car_single/domain/entities/elastic_region_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'elastic_region_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ElasticRegionModel extends ElasticRegionEntity {
  const ElasticRegionModel({
    required super.title,
    required super.id,
  });
  factory ElasticRegionModel.fromJson(Map<String, dynamic> json) =>
      _$ElasticRegionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticRegionModelToJson(this);
}
