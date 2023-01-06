import 'package:auto/features/car_single/domain/entities/elastic_car_model_entity.dart';
import 'package:auto/features/car_single/domain/entities/elastic_region_entity.dart';
import 'package:auto/features/car_single/domain/entities/elastic_search_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'elastic_search_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class ElasticSearchModel extends ElasticSearchEntity {
  const ElasticSearchModel({
    required super.id,
    required super.description,
    required super.region,
    required super.distanceTraveled,
    required super.carModel,
    required super.price,
    required super.currency,
    required super.gallery,
  });

  factory ElasticSearchModel.fromJson(Map<String, dynamic> json) =>
      _$ElasticSearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticSearchModelToJson(this);
}
