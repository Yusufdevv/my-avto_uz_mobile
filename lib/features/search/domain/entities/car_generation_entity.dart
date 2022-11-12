
import 'package:auto/features/search/data/models/car_generation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CarGenerationEntity extends Equatable {
  const CarGenerationEntity({
    this.id = 0,
    this.name = '',
    this.yearBegin = 0,
    this.yearEnd = 0,
    this.model = 0,
    this.logo = '',
  });

  final int id;
  final String name;
  final int yearBegin;
  final int yearEnd;
  final int model;
  final String logo;

  @override
  List<Object?> get props => [id, name, yearBegin, yearEnd, model, logo];
}

class CarGenerationConverter
    implements JsonConverter<CarGenerationEntity, Map<String, dynamic>> {
  const CarGenerationConverter();
  @override
  CarGenerationEntity fromJson(Map<String, dynamic>? json) =>
      CarGenerationModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarGenerationEntity object) => {};
}
