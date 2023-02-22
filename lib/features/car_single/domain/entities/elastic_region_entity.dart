import 'package:auto/features/car_single/data/model/elastic_region_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ElasticRegionEntity extends Equatable {
  final int id;
  final String title;

  const ElasticRegionEntity({
    this.id = 0,
    this.title = '',
  });

  @override
  List<Object?> get props => [
        id,
        title,
      ];
}

class ElasticRegionConverter<S>
    implements JsonConverter<ElasticRegionEntity, Map<String, dynamic>?> {
  const ElasticRegionConverter();

  @override
  ElasticRegionEntity fromJson(Map<String, dynamic>? json) =>
      ElasticRegionModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(ElasticRegionEntity object) => {};
}
