part of 'rent_single_bloc.dart';

class RentSingleState extends Equatable {
  final RentListEntity rentCar;
  final FormzStatus status;
  const RentSingleState({
    required this.rentCar,
    required this.status,
  });
  RentSingleState copyWith({
    RentListEntity? rentCar,
    FormzStatus? status,
  }) =>
      RentSingleState(
          rentCar: rentCar ?? this.rentCar, status: status ?? this.status);
  @override
  List<Object?> get props => [
        rentCar,
        status,
      ];
}
