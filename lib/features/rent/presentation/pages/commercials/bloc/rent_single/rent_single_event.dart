part of 'rent_single_bloc.dart';

abstract class RentSingleEvent {}

class RentSingleGetEvent extends RentSingleEvent {
  final int rentCarId;
  RentSingleGetEvent({required this.rentCarId});
}
