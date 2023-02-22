import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ads/data/models/query_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class QueryDataEntity extends Equatable {
  const QueryDataEntity({
    this.bodyType,
    this.driveType,
    this.gearboxType,
    this.engineType,
    this.isNew,
    this.priceFrom,
    this.priceTo,
    this.regionIn,
    this.yearFrom,
    this.yearTo,
    this.currency,
  });

  @BodyTypeEntityConverter()
  final BodyTypeEntity? bodyType;
  @DriveTypeEntityConverter()
  final DriveTypeEntity? driveType;
  final int? engineType;
  @GearboxTypeEntityConverter()
  final GearboxTypeEntity? gearboxType;
  final String? regionIn;
  final String? currency;
  final bool? isNew;
  final int? priceFrom;
  final int? priceTo;
  final int? yearFrom;
  final int? yearTo;

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
        currency
      ];
}

class QueryDataEntityConverter
    extends JsonConverter<QueryDataEntity, Map<String, dynamic>?> {
  const QueryDataEntityConverter();

  @override
  QueryDataEntity fromJson(Map<String, dynamic>? json) =>
      QueryDataModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(QueryDataEntity object) => QueryDataModel(
        bodyType: object.bodyType,
        driveType: object.driveType,
        gearboxType: object.gearboxType,
        engineType: object.engineType,
        isNew: object.isNew,
        priceFrom: object.priceFrom,
        priceTo: object.priceTo,
        regionIn: object.regionIn,
        yearFrom: object.yearFrom,
        yearTo: object.yearTo,
        currency: object.currency,
      ).toJson();
}
