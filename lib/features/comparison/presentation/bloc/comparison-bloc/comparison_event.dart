part of 'comparison_bloc.dart';

abstract class ComparisonEvent {}

class AddCarEvent extends ComparisonEvent {
  final String carModel;
  final String carMark;
  final String generation;
  AddCarEvent(
      {required this.carMark,
      required this.carModel,
      required this.generation});
}

class SetStickyEvent extends ComparisonEvent {
  final bool isSticky;
  SetStickyEvent({required this.isSticky});
}

class GetComparableCars extends ComparisonEvent {}

class GetCars extends ComparisonEvent {
  final int id;
  GetCars({required this.id});
}

// class SelectCarMark extends ComparisonEvent {
//   final String carMark;
//   SelectCarMark({required this.carMark});
// }
//
// class SelectCarModel extends ComparisonEvent {
//   final String carModel;
//   SelectCarModel({required this.carModel});
// }
//
// class SelectCarGeneration extends ComparisonEvent{
//   final String carGeneration;
//   SelectCarGeneration({required this.carGeneration});
// }
