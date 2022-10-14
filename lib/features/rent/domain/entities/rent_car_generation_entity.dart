import 'package:auto/features/rent/data/models/rent_car_generation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentCarGenerationEntity extends Equatable {
  final int id;
  final String name;
  final int yearBegin;
  final int yearEnd;
  final int model;
  final String? logo;

  const RentCarGenerationEntity({
    this.id = 0,
    this.name = '',
    this.yearBegin = 0,
    this.yearEnd = 0,
    this.model = 0,
    this.logo = '',
  });

  @override
  List<Object?> get props => [
    id,
    name,
    yearBegin,
    yearEnd,
    model,
    logo,
  ];
}

class RentCarGenerationConverter<S>
    implements JsonConverter<RentCarGenerationEntity, Map<String, dynamic>?> {
  const RentCarGenerationConverter();

  @override
  RentCarGenerationEntity fromJson(Map<String, dynamic>? json) =>
      RentCarGenerationModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentCarGenerationEntity object) => {};
}
