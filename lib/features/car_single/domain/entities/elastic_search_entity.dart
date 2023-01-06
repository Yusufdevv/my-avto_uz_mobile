import 'package:auto/features/car_single/domain/entities/elastic_car_model_entity.dart';
import 'package:auto/features/car_single/domain/entities/elastic_region_entity.dart';
import 'package:equatable/equatable.dart';

class ElasticSearchEntity extends Equatable {
  final int id;
  @ElasticCarModelEntityConverter()
  final ElasticCarModelEntity carModel;
  final List<String> gallery;
  final double price;
  final String currency;
  final int distanceTraveled;
  @ElasticRegionConverter()
  final ElasticRegionEntity region;
  final String description;

  const ElasticSearchEntity({
    this.id = 0,
    this.gallery = const [],
    this.carModel = const ElasticCarModelEntity(),
    this.price = 0,
    this.currency = '',
    this.distanceTraveled = 0,
    this.region = const ElasticRegionEntity(),
    this.description = '',
  });

  @override
  List<Object?> get props => [
        id,
        carModel,
        price,
        currency,
        distanceTraveled,
        region,
        description,
      ];
}
