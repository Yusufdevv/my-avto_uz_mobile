part of 'rent_bloc.dart';

@immutable
abstract class RentEvent {}

class Rents extends RentEvent {
  final String query;

  Rents({required this.query});
}
