import 'package:auto/features/search/data/models/car_user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CarUserEntity extends Equatable {
  const CarUserEntity({
    this.id = 0,
    this.phoneNumber = '',
    this.email = '',
    this.image = '',
    this.fullName = '',
  });

  final int id;
  final String phoneNumber;
  final String fullName;
  final String email;
  final String image;
  @override
  List<Object?> get props => [id, fullName, phoneNumber, email,image];
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
