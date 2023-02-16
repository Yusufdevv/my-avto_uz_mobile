part of 'car_type_selector_bloc.dart';

abstract class CarModelSelectorEvent {
  const CarModelSelectorEvent();
}

class SelectedCarTypeEvent extends CarModelSelectorEvent {
  final int id;
  const SelectedCarTypeEvent({required this.id});
}

class CarModelSelectorGetEvent extends CarModelSelectorEvent {
  final String? searchPattern;
  CarModelSelectorGetEvent({this.searchPattern});
}

// class ConfirmCarTypeEvent extends CarTypeSelectorEvent{
//   const ConfirmCarTypeEvent();
//   @override
//   List<Object?> get props =>[];
// }
//
// class RevertCarTypeEvent extends CarTypeSelectorEvent{
//   const RevertCarTypeEvent();
//   @override
//   List<Object?> get props => [];
//
// }
