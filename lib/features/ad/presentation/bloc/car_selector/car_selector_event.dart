part of 'car_selector_bloc.dart';

abstract class CarSelectorEvent extends Equatable {
  const CarSelectorEvent();
}

class SelectedCarItemEvent extends CarSelectorEvent {
  final int id;
  final String name;
  final String imageUrl;
  const SelectedCarItemEvent({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
  @override
  List<Object?> get props => [id, name];
}

class ConfirmCarOption extends CarSelectorEvent {
  const ConfirmCarOption();

  @override
  List<Object?> get props => [];
}

class RevertCarOption extends CarSelectorEvent {
  const RevertCarOption();

  @override
  List<Object?> get props => [];
}
