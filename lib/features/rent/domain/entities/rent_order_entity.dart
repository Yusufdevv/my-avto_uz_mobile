import 'package:equatable/equatable.dart';

class RentOrderEntity extends Equatable {
  const RentOrderEntity({
    required this.rent,
    required this.userName,
    required this.phoneNumber,
    required this.startDate,
    required this.endDate,
    required this.startLongitude,
    required this.startLatitude,
    required this.endLongitude,
    required this.endLatitude,
    required this.additionalServices,
  });

  final int rent;
  final String userName;
  final String phoneNumber;
  final DateTime startDate;
  final DateTime endDate;
  final int startLongitude;
  final int startLatitude;
  final int endLongitude;
  final int endLatitude;
  final List<int> additionalServices;

  RentOrderEntity copyWith({
    int? rent,
    String? userName,
    String? phoneNumber,
    DateTime? startDate,
    DateTime? endDate,
    int? startLongitude,
    int? startLatitude,
    int? endLongitude,
    int? endLatitude,
    List<int>? additionalServices,
  }) =>
      RentOrderEntity(
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
