import 'package:auto/features/rent/data/models/rent_car_models_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentCarModelsEntity extends Equatable {
  final int id;
  final String name;
  final int make;

  const RentCarModelsEntity({
    this.id = 0,
    this.name = '',
    this.make = 0,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    make,
  ];
}

class RentCarModelsConverter<S>
    implements JsonConverter<RentCarModelsEntity, Map<String, dynamic>?> {
  const RentCarModelsConverter();

  @override
  RentCarModelsEntity fromJson(Map<String, dynamic>? json) =>
      RentCarModelsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentCarModelsEntity object) => {};
}
