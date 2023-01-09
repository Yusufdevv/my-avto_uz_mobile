import 'package:auto/features/ad/data/models/car_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CarModelEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'make', defaultValue: '')
  final String make;

  const CarModelEntity({
    required this.id,
    required this.name,
    required this.make,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        make,
      ];
}

class CarModelEntityConverter
    extends JsonConverter<CarModelEntity, Map<String, dynamic>?> {
  const CarModelEntityConverter();

  @override
  CarModelEntity fromJson(Map<String, dynamic>? json) =>
      CarModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarModelEntity object) => {};
}
