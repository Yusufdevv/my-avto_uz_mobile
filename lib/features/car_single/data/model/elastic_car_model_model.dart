import 'package:auto/features/car_single/domain/entities/elastic_car_model_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'elastic_car_model_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ElasticCarModel extends ElasticCarModelEntity {
  const ElasticCarModel({
    required super.id,
    required super.name,
  });

  factory ElasticCarModel.fromJson(Map<String, dynamic> json) =>
      _$ElasticCarModelFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticCarModelToJson(this);
}
