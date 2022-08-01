part of 'car_type_selector_bloc.dart';

abstract class CarTypeSelectorEvent extends Equatable {
  const CarTypeSelectorEvent();
}


class SelectedCarTypeEvent extends CarTypeSelectorEvent{
  final int id;
  const SelectedCarTypeEvent({required this.id});
  @override
  List<Object?> get props => [id];
}


class ConfirmCarTypeEvent extends CarTypeSelectorEvent{
  const ConfirmCarTypeEvent();
  @override
  List<Object?> get props =>[];
}

class RevertCarTypeEvent extends CarTypeSelectorEvent{
  const RevertCarTypeEvent();
  @override
  List<Object?> get props => [];

}