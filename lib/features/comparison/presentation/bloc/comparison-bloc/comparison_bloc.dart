import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/comparison/domain/entities/comparison_entity.dart';
import 'package:auto/features/comparison/domain/usecases/comparison_cars_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'comparison_event.dart';
part 'comparison_state.dart';

class ComparisonBloc extends Bloc<ComparisonEvent, ComparisonState> {
  final ComparisonCarsUseCase comparisonCarsUseCase;
  ComparisonBloc({required this.comparisonCarsUseCase})
      : super(const ComparisonState(
            cars: [], onlyDifferences: false, isSticky: false)) {
    on<GetComparableCars>((event, emit) async {
      final result = await comparisonCarsUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(cars: result.right));
      } else {
        emit(state.copyWith());
      }
    });
    on<SetStickyEvent>((event, emit) {
      emit(state.copyWith(isSticky: event.isSticky));
    });
  }
}
