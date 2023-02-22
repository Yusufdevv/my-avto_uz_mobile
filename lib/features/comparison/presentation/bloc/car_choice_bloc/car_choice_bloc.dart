import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'car_choice_event.dart';
part 'car_choice_state.dart';

class CarChoiceBloc extends Bloc<CarChoiceEvent, CarChoiceState> {
  CarChoiceBloc() : super(CarChoiceInitial()) {
    on<CarChoiceEvent>((event, emit) {});
  }
}
