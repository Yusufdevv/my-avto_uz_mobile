import 'package:auto/features/comparison/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class UserEntity extends Equatable {
  const UserEntity({
    this.id = 0,
    this.name = '',
    this.phoneNumber = '',
    this.avatar = '',
    this.fullName = '',
    this.image = '',
  });

  final int id;
  final String name;
  final String phoneNumber;
  final String avatar;
  final String fullName;
  final dynamic image;

  @override
  List<Object?> get props => [
        id,
        name,
        phoneNumber,
        avatar,
        fullName,
        image,
      ];
}

class UserConverter
    implements JsonConverter<UserEntity, Map<String, dynamic>?> {
  const UserConverter();
  @override
  UserEntity fromJson(Map<String, dynamic>? json) =>
      UserModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(UserEntity object) => {};
}
