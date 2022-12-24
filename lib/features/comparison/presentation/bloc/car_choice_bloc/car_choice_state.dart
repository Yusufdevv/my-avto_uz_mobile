part of 'car_choice_bloc.dart';

abstract class CarChoiceState extends Equatable {
  const CarChoiceState();
}

class CarChoiceInitial extends CarChoiceState {
  @override
  List<Object> get props => [];
}
