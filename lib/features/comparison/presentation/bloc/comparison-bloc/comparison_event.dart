part of 'comparison_bloc.dart';

abstract class ComparisonEvent extends Equatable {
  const ComparisonEvent();
}

class AddCarEvent extends ComparisonEvent {
  final String carModel;
  final String carMark;
  final String generation;
  const AddCarEvent(
      {required this.carMark,
      required this.carModel,
      required this.generation});

  @override
  List<Object?> get props => [carModel, carMark, generation];
}

class SetStickyEvent extends ComparisonEvent {
  final bool isSticky;
  const SetStickyEvent({required this.isSticky});

  @override
  List<Object?> get props => [isSticky];
}

class GetComparableCars extends ComparisonEvent {
  @override
  List<Object?> get props => [];
}

class GetCars extends ComparisonEvent {
  final int id;
  const GetCars({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetMakeModelEvent extends ComparisonEvent {
  final MakeEntity selectedMake;
  final MakeEntity selectedModel;

  const GetMakeModelEvent(
      {required this.selectedMake, required this.selectedModel});

  @override
  List<Object?> get props => [selectedMake, selectedModel];
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
