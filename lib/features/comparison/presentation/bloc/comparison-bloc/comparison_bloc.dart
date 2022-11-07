import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/car_params_entity.dart';

part 'comparison_event.dart';
part 'comparison_state.dart';

class ComparisonBloc extends Bloc<ComparisonEvent, ComparisonState> {
  ComparisonBloc()
      : super(const ComparisonState(
            cars: [], onlyDifferences: false, isSticky: false)) {
    on<AddCarEvent>((event, emit) {
      var newList = [...state.cars];
      newList.add(CarParamsEntity(
          mark: event.carMark, price: 500000000, model: event.carModel));
      emit(state.copyWith(cars: newList));
    });
    on<SetStickyState>((event, emit) {
      emit(state.copyWith(isSticky: event.isSticky));
    });
  }
}
