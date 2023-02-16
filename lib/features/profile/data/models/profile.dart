import 'package:auto/features/profile/domain/entities/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.lastName,
    required super.firstName,
    required super.image,
    // required super.region,
    required super.email,
    required super.phoneNumber,
    required super.fullName,
    required super.dateJoined,
    required super.isActive,
    required super.isDealer,
    required super.isStaff,
    required super.isSuperuser,
    required super.lastLogin,
    required super.username,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
