import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/comparison/domain/entities/comparison_entity.dart';
import 'package:auto/features/comparison/domain/usecases/comparison_cars_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'comparison_event.dart';
part 'comparison_state.dart';

class ComparisonBloc extends Bloc<ComparisonEvent, ComparisonState> {
  final ComparisonCarsUseCase comparisonCarsUseCase;
  ComparisonBloc({required this.comparisonCarsUseCase})
      : super(const ComparisonState(
            cars: [],
            onlyDifferences: false,
            isSticky: false,
            status: FormzStatus.pure)) {
    on<GetComparableCars>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await comparisonCarsUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          cars: result.right,
          status: FormzStatus.submissionSuccess,
        ));
      } else {
        emit(state.copyWith(status:  FormzStatus.submissionFailure));
      }
    });
    on<SetStickyEvent>((event, emit) {
      emit(state.copyWith(isSticky: event.isSticky));
    });
  }
}
