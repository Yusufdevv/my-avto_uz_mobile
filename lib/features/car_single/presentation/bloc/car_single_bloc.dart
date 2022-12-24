import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';

part 'car_single_event.dart';
part 'car_single_state.dart';

class CarSingleBloc extends Bloc<CarSingleEvent, CarSingleState> {
  final GetCarSingleUseCase _getCarSingleUseCase;

  CarSingleBloc({
    required GetCarSingleUseCase getCarSingleUseCase,
  })  : _getCarSingleUseCase = getCarSingleUseCase,
        super(const CarSingleState()) {
    on<GetCarSingle>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await _getCarSingleUseCase.call(event.id);
      if (result.isRight) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess, carSingle: result.right));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
