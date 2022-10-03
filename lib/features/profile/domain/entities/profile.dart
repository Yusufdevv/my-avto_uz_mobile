import 'package:auto/features/profile/data/models/user_count.dart';
import 'package:auto/features/profile/domain/entities/user_count.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ProfileEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'username', defaultValue: '')
  final String username;
  @JsonKey(name: 'firs_name', defaultValue: '')
  final String firstName;
  @JsonKey(name: 'last_name', defaultValue: '')
  final String lastName;
  @JsonKey(name: 'full_name', defaultValue: '')
  final String fullName;
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @JsonKey(name: 'image', defaultValue: '')
  final String image;
  @JsonKey(name: 'region', defaultValue: 0)
  final int region;
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;
  @JsonKey(name: 'is_dealer', defaultValue: false)
  final bool isDealer;
  @JsonKey(name: 'is_active', defaultValue: false)
  final bool isActive;
  @JsonKey(name: 'is_staff', defaultValue: false)
  final bool isStaff;
  @JsonKey(name: 'is_superuser', defaultValue: false)
  final bool isSuperuser;
  @JsonKey(name: 'last_login', defaultValue: '')
  final String lastLogin;
  @JsonKey(name: 'date_joined', defaultValue: '')
  final String dateJoined;

  const ProfileEntity({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.image,
    required this.region,
    required this.email,
    required this.phoneNumber,
    required this.fullName,
    required this.dateJoined,
    required this.isActive,
    required this.isDealer,
    required this.isStaff,
    required this.isSuperuser,
    required this.lastLogin,
    required this.username,
  });

  @override
  List<Object?> get props => [
        id,
        lastName,
        firstName,
        image,
        region,
        email,
        phoneNumber,
        fullName,
        dateJoined,
        isActive,
        isDealer,
        isStaff,
        isSuperuser,
        lastLogin,
        username,
      ];
}
