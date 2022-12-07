import 'package:auto/features/car_single/data/model/car_user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CarUserEntity extends Equatable {
  final int id;
  final String phoneNumber;
  final String fullName;
  final String? image;

  const CarUserEntity({
    this.id = 0,
    this.phoneNumber = '',
    this.fullName = '',
    this.image = '',
  });

  @override
  List<Object?> get props => [
        id,
        phoneNumber,
        fullName,
        image,
      ];
}

class CarUserConverter<S> implements JsonConverter<CarUserEntity, Map<String, dynamic>?> {
  const CarUserConverter();

  @override
  CarUserEntity fromJson(Map<String, dynamic>? json) => CarUserModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarUserEntity object) => {};
}
