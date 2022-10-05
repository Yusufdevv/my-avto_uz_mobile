import 'package:auto/features/rent/data/models/rent_car_make_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentCarMakeEntity extends Equatable {
  final int id;
  final String name;
  final String? logo;

  const RentCarMakeEntity({
    this.id = 0,
    this.name = '',
    this.logo = '',
  });

  @override
  List<Object?> get props => [
    id,
    name,
    logo,
  ];
}

class RentCarMakeConverter<S>
    implements JsonConverter<RentCarMakeEntity, Map<String, dynamic>?> {
  const RentCarMakeConverter();

  @override
  RentCarMakeEntity fromJson(Map<String, dynamic>? json) =>
      RentCarMakeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentCarMakeEntity object) => {};
}
