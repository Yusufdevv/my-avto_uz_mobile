import 'package:auto/features/rent/data/models/rent_car_modification_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentCarModificationEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String power;
  @JsonKey(defaultValue: '')
  final String volume;

  const RentCarModificationEntity({
    this.id = 0,
    this.power = '',
    this.volume = '',
  });

  @override
  List<Object?> get props => [
    id,
    power,
    volume,
  ];
}

class RentCarModificationConverter<S>
    implements JsonConverter<RentCarModificationEntity, Map<String, dynamic>?> {
  const RentCarModificationConverter();

  @override
  RentCarModificationEntity fromJson(Map<String, dynamic>? json) =>
      RentCarModificationModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentCarModificationEntity object) => {};
}
