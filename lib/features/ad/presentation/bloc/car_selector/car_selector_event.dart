part of 'car_selector_bloc.dart';

abstract class CarSelectorEvent extends Equatable {
  const CarSelectorEvent();
}

class SelectedCarItemEvent extends CarSelectorEvent{
  final int id;
  const SelectedCarItemEvent({required this.id});
  @override
  List<Object?> get props => [id];
}


class ConfirmCarOption extends CarSelectorEvent{

  const ConfirmCarOption();

  @override
  List<Object?> get props => [];
}

class RevertCarOption extends CarSelectorEvent{

  const RevertCarOption();

  @override
  List<Object?> get props => [];

}