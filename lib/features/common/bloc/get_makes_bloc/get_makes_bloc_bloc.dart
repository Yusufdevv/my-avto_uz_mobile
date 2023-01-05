import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/common/entities/makes_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_makes_bloc_event.dart';
part 'get_makes_bloc_state.dart';
part 'get_makes_bloc_bloc.freezed.dart';

class GetMakesBloc extends Bloc<GetMakesBlocEvent, GetMakesState> {
  final int selectedMakeId;
  final GetMakesUseCase useCase;
  GetMakesBloc({required this.useCase, required this.selectedMakeId})
      : super(GetMakesState()) {
    on<_ChangeSelected>((event, emit) {
      emit(state.copyWith(selected: event.index));
    });
    on<_GetMakes>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(state.search);
      if (result.isRight) {
        emit(
          state.copyWith(
            selected: result.right.results
                .indexWhere((element) => element.id == selectedMakeId),
            makes: result.right,
            status: FormzStatus.submissionSuccess,
            count: result.right.count,
            next: result.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetSerched>((event, emit) => emit(state.copyWith(search: event.naem)));
  }
}
