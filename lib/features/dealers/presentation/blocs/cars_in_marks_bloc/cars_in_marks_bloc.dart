import 'package:auto/features/dealers/data/datasource/cars_in_marks_datasource.dart';
import 'package:auto/features/dealers/domain/entities/cars_in_marks_entity.dart';
import 'package:auto/features/dealers/domain/usecases/cars_in_marks_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cars_in_marks_event.dart';
part 'cars_in_marks_state.dart';
part 'cars_in_marks_bloc.freezed.dart';

class CarsInMarksBloc extends Bloc<CarsInMarksEvent, CarsInMarksState> {
  final CarsInMarksUseCase carsInMarksUseCase;

  CarsInMarksBloc({required this.carsInMarksUseCase})
      : super(CarsInMarksState()) {
    on<_GetResults>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await carsInMarksUseCase.call(event.params);
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            cars: result.right.results,
            next: result.right.next,
            moreFetch: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetMoreResults>((event, emit) async {
      final result = await carsInMarksUseCase.call(event.params);
      if (result.isRight) {
        emit(
          state.copyWith(
            cars: [...state.cars, ...result.right.results],
            next: result.right.next,
            moreFetch: result.right.next != null,
          ),
        );
      }
    });
  }
}
