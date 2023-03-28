import 'dart:async';
import 'dart:core';
import 'package:auto/features/ad/data/models/pagination/get_pagination_param_model.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'get_makes_event.dart';

part 'get_makes_state.dart';

class GetMakesBloc extends Bloc<GetMakesEvent, GetMakesState> {
  final GetMakesUseCase useCase = GetMakesUseCase();

  GetMakesBloc({MakeEntity? initialMake})
      : super(GetMakesState(
          selectedMake: initialMake,
          status: FormzStatus.pure,
        )) {
    on<GetMakesGetEvent>(_get);
    on<GetMakesGetSearchedEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            name: event.name,
          ),
        );
        add(GetMakesGetEvent());
      },
    );

    on<GetMakesSelectedCarItemsEvent>((event, emit) {
      emit(state.copyWith(selectedMake: event.makeEntity));
    });

    on<GetMakesGoToIndexEvent>(
      (event, emit) {
        final index = state.makes.indexWhere((element) =>
            element.name.toLowerCase().startsWith(event.letter.toLowerCase()));

        emit(
          state.copyWith(
            selectChar: event.letter,
            goToIndex: index == -1 ? null : index,
          ),
        );
      },
    );
  }

  FutureOr<void> _get(event, Emitter<GetMakesState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await useCase.call(
      GetPaginationParam(
        next: state.next,
        offset: 0,
        limit: 1000,
        name: state.name,
      ),
    );

    if (result.isRight) {
      emit(
        state.copyWith(
          makes: result.right.results,
          next: result.right.next ?? '',
          status: FormzStatus.submissionSuccess,
        ),
      );
    }
  }
}
