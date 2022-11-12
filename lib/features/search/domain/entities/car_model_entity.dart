
import 'package:auto/features/search/data/models/car_model_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CarModelEntity extends Equatable {
  const CarModelEntity({this.id = 0, this.name = '', this.make = 0});

  final int id;
  final String name;
  final int make;

  @override
  List<Object?> get props => [id, name, make];
}

class CarModelConverter
    implements JsonConverter<CarModelEntity, Map<String, dynamic>?> {
  const CarModelConverter();
  @override
  CarModelEntity fromJson(Map<String, dynamic>? json) =>
      CarModelModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(CarModelEntity object) => {};
}
