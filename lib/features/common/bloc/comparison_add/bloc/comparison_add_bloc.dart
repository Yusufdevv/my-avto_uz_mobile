import 'package:auto/features/comparison/domain/usecases/comparison_add_use_case.dart';
import 'package:auto/features/comparison/domain/usecases/delete_comparison_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comparison_add_event.dart';
part 'comparison_add_state.dart';
part 'comparison_add_bloc.freezed.dart';

class ComparisonAddBloc extends Bloc<ComparisonAddEvent, ComparisonAddState> {
  final ComparisonAddUseCase addUseCase;
  final DeleteComparisonUseCase deleteUseCase;
  ComparisonAddBloc({required this.addUseCase, required this.deleteUseCase})
      : super(ComparisonAddState()) {
    on<_PostComparisonCars>((event, emit) async {
      emit(state.copyWith(addStatus: FormzStatus.submissionInProgress));
      final result = await addUseCase(event.id);
      if (result.isRight) {
        emit(state.copyWith(
            addStatus: FormzStatus.submissionSuccess, count: state.count + 1));
      } else {
        emit(state.copyWith(addStatus: FormzStatus.submissionFailure));
      }
    });
    on<_DeleteComparison>((event, emit) async {
      emit(state.copyWith(removeStatus: FormzStatus.submissionInProgress));
      final result = await deleteUseCase(event.id);
      if (result.isRight) {
        emit(state.copyWith(removeStatus: FormzStatus.submissionSuccess));
        if (state.count > 0) {
          emit(state.copyWith(count: state.count - 1));
        }
      } else {
        emit(state.copyWith(removeStatus: FormzStatus.submissionFailure));
      }
    });

    on<_ClearCountComparison>((event, emit) async {
      emit(state.copyWith(count: 0));
    });

    on<_AddToMapComparison>((event, emit) async {
      final map = {...state.map};
      map[event.id] = event.value;
      emit(state.copyWith(map: map));
    });
  }
}
