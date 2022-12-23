import 'package:auto/features/common/domain/model/car_modification_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CarModificationTypeEntity extends Equatable {
  const CarModificationTypeEntity({
    this.id = -1,
    this.power = '',
    this.volume = '',
  });

  final int id;
  final String power;
  final String volume;

  @override
  List<Object?> get props => [id, power, volume];
}

class CarModificationTypeConverter
    implements JsonConverter<CarModificationTypeEntity, Map<String, dynamic>?> {
  const CarModificationTypeConverter();

  @override
  CarModificationTypeEntity fromJson(Map<String, dynamic>? json) =>
      CarModificationTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarModificationTypeEntity object) =>
      CarModificationTypeModel(
              id: object.id, power: object.power, volume: object.volume)
          .toJson();
}
