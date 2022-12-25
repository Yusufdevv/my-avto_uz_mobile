import 'package:auto/features/profile/domain/entities/profile_data_entity.dart';

class ProfileDataModel extends ProfileDataEntity {
  ProfileDataModel({
    required super.id,
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.fullName,
    required super.email,
    required super.image,
    required super.region,
    required super.phoneNumber,
    required super.isDealer,
    required super.isActive,
    required super.isStaff,
    required super.isSuperuser,
    required super.lastLogin,
    required super.dateJoined,
    required super.usercountdata,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) => ProfileDataModel(
        id: json['id'],
        username: json['username'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        fullName: json['full_name'],
        email: json['email'],
        image: json['image'],
        region: Region.fromJson(json['region']),
        phoneNumber: json['phone_number'],
        isDealer: json['is_dealer'],
        isActive: json['is_active'],
        isStaff: json['is_staff'],
        isSuperuser: json['is_superuser'],
        lastLogin: json['last_login'],
        dateJoined: DateTime.parse(json['date_joined']),
        usercountdata: Usercountdata.fromJson(json['usercountdata']),
    );
}
