import 'package:auto/features/comparison/domain/usecases/comparison_add_use_case.dart';
import 'package:auto/features/comparison/domain/usecases/delete_comparison.dart';
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
      final result = await addUseCase.call(event.id);
      if (result.isRight) {
        emit(state.copyWith(addStatus: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(addStatus: FormzStatus.submissionFailure));
      }
    });
    on<_DeleteComparison>((event, emit) async {
      emit(state.copyWith(removeStatus: FormzStatus.submissionInProgress));
      final result = await deleteUseCase.call(event.id);
      if (result.isRight) {
        emit(state.copyWith(removeStatus: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(removeStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
