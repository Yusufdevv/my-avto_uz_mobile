import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
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
          status: FormzStatus.pure,
          selectedMake: MakeEntity(),
          selectedModel: MakeEntity(),
        )) {
    on<GetComparableCars>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await comparisonCarsUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          cars: result.right,
          status: FormzStatus.submissionSuccess,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<SetStickyEvent>((event, emit) {
      emit(state.copyWith(isSticky: event.isSticky));
    });
    on<GetCars>((event, emit) {
      final list = <ComparisonEntity>[...state.cars];
      final item = list.firstWhere((element) => element.id == event.id);
      list.remove(item);
      emit(state.copyWith(cars: list));
    });

    on<GetMakeModelEvent>(_onGetMakeModel);
  }

  void _onGetMakeModel(GetMakeModelEvent event, Emitter<ComparisonState> emit) {
    emit(state.copyWith(
        selectedMake: event.selectedMake, selectedModel: event.selectedModel));
  }
}
