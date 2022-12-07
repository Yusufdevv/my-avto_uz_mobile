part of 'car_single_bloc.dart';

@immutable
abstract class CarSingleEvent {}

class GetCarSingle extends CarSingleEvent {
  final int id;
  GetCarSingle({required this.id});
}
