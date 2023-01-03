import 'package:auto/features/comparison/domain/usecases/comparison_add_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comparison_add_event.dart';
part 'comparison_add_state.dart';
part 'comparison_add_bloc.freezed.dart';

class ComparisonAddBloc extends Bloc<ComparisonAddEvent, ComparisonAddState> {
  final ComparisonAddUseCase useCase;
  ComparisonAddBloc({required this.useCase}) : super(ComparisonAddState()) {
    on<_PostComparisonCars>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(event.id);
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
