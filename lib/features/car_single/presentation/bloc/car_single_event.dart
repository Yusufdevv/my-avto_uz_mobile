part of 'car_single_bloc.dart';

@Freezed()
class CarSingleEvent with _$CarSingleEvent {
  factory CarSingleEvent.getSingle(int id) = _GetSingle;
}
