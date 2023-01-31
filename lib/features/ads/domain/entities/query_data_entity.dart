import 'package:auto/features/ads/data/models/query_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class QueryDataEntity extends Equatable {
  const QueryDataEntity({
    this.bodyType = 0,
    this.driveType = 0,
    this.engineType = 0,
    this.gearboxType = 0,
    this.regionIn = '',
    this.isNew,
    this.priceFrom = 0,
    this.priceTo = 0,
    this.yearFrom = 0,
    this.yearTo = 0,
  });

  final int bodyType;
  final int driveType;
  final int engineType;
  final int gearboxType;
  final String regionIn;
  final bool? isNew;
  final int priceFrom;
  final int priceTo;
  final int yearFrom;
  final int yearTo;

  @override
  List<Object?> get props => [
        bodyType,
        driveType,
        engineType,
        gearboxType,
        regionIn,
        isNew,
        priceFrom,
        priceTo,
        yearFrom,
        yearTo,
      ];
}

class QueryDataConverter
    implements JsonConverter<QueryDataEntity, Map<String, dynamic>?> {
  const QueryDataConverter();
  @override
  QueryDataEntity fromJson(Map<String, dynamic>? json) =>
      QueryDataModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(QueryDataEntity object) => {};
}
