import 'package:auto/features/profile/data/models/profile.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ProfileEntity extends Equatable {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String fullName;
  final String email;
  final String image;
  // @RegionConverter()
  // final RegionEntity region;
  final String phoneNumber;
  final bool isDealer;
  final bool isActive;
  final bool isStaff;
  final bool isSuperuser;
  final String lastLogin;
  final String dateJoined;

  const ProfileEntity({
    this.id = 0,
    this.lastName = '',
    this.firstName = '',
    this.image = '',
    // this.region = const RegionEntity(),
    this.email = '',
    this.phoneNumber = '',
    this.fullName = '',
    this.dateJoined = '',
    this.isActive = false,
    this.isDealer = false,
    this.isStaff = false,
    this.isSuperuser = false,
    this.lastLogin = '',
    this.username = '',
  });

  @override
  List<Object?> get props => [
        id,
        username,
        firstName,
        lastName,
        fullName,
        email,
        image,
        // region,
        phoneNumber,
        isDealer,
        isActive,
        isStaff,
        isSuperuser,
        lastLogin,
        dateJoined
      ];
}

class ProfileConverter
    implements JsonConverter<ProfileEntity, Map<String, dynamic>?> {
  const ProfileConverter();

  @override
  ProfileEntity fromJson(Map<String, dynamic>? json) =>
      ProfileModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(ProfileEntity object) => {};
}
