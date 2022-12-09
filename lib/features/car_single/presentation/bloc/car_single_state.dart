part of 'car_single_bloc.dart';

class CarSingleState extends Equatable {
  final FormzStatus status;
  final CarSingleEntity carSingle;

  const CarSingleState({
    this.status = FormzStatus.pure,
    this.carSingle = const CarSingleEntity(),
  });

  CarSingleState copyWith({
    FormzStatus? status,
    CarSingleEntity? carSingle,
  }) =>
      CarSingleState(
        status: status ?? this.status,
        carSingle: carSingle ?? this.carSingle,
      );

  @override
  List<Object?> get props => [
        status,
        carSingle,
      ];
}
