import 'package:auto/features/car_single/data/model/car_user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CarUserEntity extends Equatable {
  final int id;
  final String phoneNumber;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String? avatar;
  final String fullName;
  final String? image;

  const CarUserEntity({
    this.id = 0,
    this.fullName = '',
    this.image = '',
    this.phoneNumber = '',
    this.name = '',
    this.avatar = '',
  });

  @override
  List<Object?> get props => [
        id,
        phoneNumber,
        name,
        avatar,
        name,
        image,
      ];
}

class CarUserConverter
    implements JsonConverter<CarUserEntity, Map<String, dynamic>?> {
  const CarUserConverter();

  @override
  CarUserEntity fromJson(Map<String, dynamic>? json) =>
      CarUserModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(CarUserEntity object) => {};
}
