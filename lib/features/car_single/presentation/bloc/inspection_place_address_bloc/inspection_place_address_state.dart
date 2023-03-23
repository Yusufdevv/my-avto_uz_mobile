part of 'inspection_place_address_bloc.dart';

@immutable
class InspectionPlaceAddressState extends Equatable {
  final String address;
  final FormzStatus status;

  const InspectionPlaceAddressState({
    required this.status,
    required this.address,
  });

  InspectionPlaceAddressState copyWith({
    String? address,
    FormzStatus? status,
  }) =>
      InspectionPlaceAddressState(
        status: status ?? this.status,
        address: address ?? this.address,
      );

  @override
  List<Object?> get props => [
        address,
        status,
      ];
}
