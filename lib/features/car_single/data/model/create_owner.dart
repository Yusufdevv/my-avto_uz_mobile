import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_owner.g.dart';

@JsonSerializable()
class CreateOwnerModel extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'announcement', defaultValue: 361)
  final int announcement;
  @JsonKey(name: 'technical_passport_front', defaultValue: '')
  final String technicalPasswordFront;
  @JsonKey(name: 'technical_passport_back', defaultValue: '')
  final String technicalPasswordBack;
  @JsonKey(name: 'driver_license_front', defaultValue: '')
  final String driverLicenceFront;
  @JsonKey(name: 'driver_license_back', defaultValue: '')
  final String driverlicenceBack;
  @JsonKey(name: 'additional_info', defaultValue: '')
  final String additionalInfo;
  @JsonKey(name: 'user', defaultValue: 0)
  final int user;

  const CreateOwnerModel({
    required this.id,
    required this.user,
    required this.announcement,
    required this.additionalInfo,
    required this.driverlicenceBack,
    required this.driverLicenceFront,
    required this.technicalPasswordBack,
    required this.technicalPasswordFront,
  });

  @override
  List<Object?> get props => [
        id,
        user,
        announcement,
        additionalInfo,
        driverlicenceBack,
        driverLicenceFront,
        technicalPasswordBack,
        technicalPasswordFront,
      ];
  factory CreateOwnerModel.fromJson(Map<String, dynamic> json) =>
      _$CreateOwnerModelFromJson(json);
}
