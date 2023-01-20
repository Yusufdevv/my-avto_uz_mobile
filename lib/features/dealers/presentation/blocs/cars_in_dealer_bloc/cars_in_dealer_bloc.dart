import 'package:auto/features/dealers/domain/entities/cars_in_dealer_entity.dart';
import 'package:auto/features/dealers/domain/usecases/cars_in_dealers_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'cars_in_dealer_event.dart';
part 'cars_in_dealer_state.dart';
part 'cars_in_dealer_bloc.freezed.dart';

class CarsInDealerBloc extends Bloc<CarsInDealerEvent, CarsInDealerState> {
  final CarsInDealerUseCase carsInDealerUseCase;

  CarsInDealerBloc({required this.carsInDealerUseCase})
      : super(CarsInDealerState()) {
    on<_GetResults>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await carsInDealerUseCase.call(event.slug);
      if (result.isRight) {
        emit(
          state.copyWith(
              status: FormzStatus.submissionSuccess, cars: result.right.results),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
