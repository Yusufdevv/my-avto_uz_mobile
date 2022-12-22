import 'package:equatable/equatable.dart';

class RegisterLeaseEntity extends Equatable {
  const RegisterLeaseEntity({
    this.rent = -1,
    this.userName = '',
    this.phoneNumber = '',
    this.startDate = '',
    this.endDate = '',
    this.startLongitude = 0,
    this.startLatitude = 0,
    this.endLongitude = 0,
    this.endLatitude = 0,
    this.additionalServices = const [],
  });

  final int rent;
  final String userName;
  final String phoneNumber;
  final String startDate;
  final String endDate;
  final num startLongitude;
  final num startLatitude;
  final num endLongitude;
  final num endLatitude;
  final List<int> additionalServices;

  RegisterLeaseEntity copyWith({
    int? rent,
    String? userName,
    String? phoneNumber,
    String? startDate,
    String? endDate,
    num? startLongitude,
    num? startLatitude,
    num? endLongitude,
    num? endLatitude,
    List<int>? additionalServices,
  }) =>
      RegisterLeaseEntity(
        rent: rent ?? this.rent,
        userName: userName ?? this.userName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        startLongitude: startLongitude ?? this.startLongitude,
        startLatitude: startLatitude ?? this.startLatitude,
        endLongitude: endLongitude ?? this.endLongitude,
        endLatitude: endLatitude ?? this.endLatitude,
        additionalServices: additionalServices ?? this.additionalServices,
      );
  Map<String, dynamic> toApi() => {
        'rent': rent,
        'user_name': userName,
        'phone_number': phoneNumber,
        'start_date': startDate,
        'end_date': endDate,
        'start_longitude': startLongitude,
        'start_latitude': startLatitude,
        'end_longitude': endLongitude,
        'end_latitude': endLatitude,
        'additional_services': additionalServices
      };

  @override
  List<Object?> get props => [
        rent,
        userName,
        phoneNumber,
        startDate,
        endDate,
        startLongitude,
        startLatitude,
        endLongitude,
        endLatitude,
        additionalServices,
      ];
}
