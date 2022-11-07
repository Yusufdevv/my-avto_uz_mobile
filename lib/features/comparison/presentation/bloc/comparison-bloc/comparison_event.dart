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

class SetStickyState extends ComparisonEvent {
  final bool isSticky;
  SetStickyState({required this.isSticky});
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
