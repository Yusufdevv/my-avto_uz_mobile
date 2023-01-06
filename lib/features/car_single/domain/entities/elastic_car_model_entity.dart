import 'package:auto/features/car_single/data/model/elastic_car_model_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ElasticCarModelEntity extends Equatable {
  final int id;
  final String name;

  const ElasticCarModelEntity({
    this.name = '',
    this.id = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class ElasticCarModelEntityConverter<S>
    implements JsonConverter<ElasticCarModelEntity, Map<String, dynamic>?> {
  const ElasticCarModelEntityConverter();

  @override
  ElasticCarModelEntity fromJson(Map<String, dynamic>? json) =>
      ElasticCarModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(ElasticCarModelEntity object) => {};
}
