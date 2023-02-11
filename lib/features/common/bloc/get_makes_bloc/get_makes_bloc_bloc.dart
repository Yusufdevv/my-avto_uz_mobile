// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/domain/usecases/get_top_makes.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_makes_bloc_event.dart';
part 'get_makes_bloc_state.dart';
part 'get_makes_bloc_bloc.freezed.dart';

class GetMakesBloc extends Bloc<GetMakesBlocEvent, GetMakesState> {
  final GetMakesUseCase useCase;
  final GetTopMakesUseCase topUseCase;
  GetMakesBloc({
    required this.useCase,
    required this.topUseCase,
    int? initialId,
  }) : super(GetMakesState(selectId: initialId ?? -1)) {
    on<_ChangeSelected>((event, emit) {
      emit(state.copyWith(selectId: event.id));
    });

    on<_SortMakes>((event, emit) {
      final firstMakes = state.makes
          .where((element) => element.name.startsWith(event.letter))
          .toList();
      final secondMakes = state.makes
          .where((element) => !element.name.startsWith(event.letter));
      emit(state.copyWith(
          makes: firstMakes.isEmpty
              ? state.makes
              : [...firstMakes, ...secondMakes]));
    });

    on<_GetIsCheck>((event, emit) => emit(state.copyWith(ischeck: true)));

    on<_GetMakes>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(state.search);
      if (result.isRight) {
        emit(
          state.copyWith(
            makes: result.right.results,
            status: FormzStatus.submissionSuccess,
            count: result.right.count,
            next: result.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<_GetTopMakes>((event, emit) async {
      emit(state.copyWith(statusTop: FormzStatus.submissionInProgress));
      final result = await topUseCase.call('');
      if (result.isRight) {
        emit(
          state.copyWith(
            topMakes: result.right.results,
            next: result.right.next,
            statusTop: FormzStatus.submissionSuccess,
          ),
        );
      } else {
        emit(state.copyWith(statusTop: FormzStatus.submissionFailure));
      }
    });

    on<_GetNextTop>((event, emit) async {
      if (state.next != null) {
        final result =
            await topUseCase.call(state.next == null ? '' : state.next!);
        if (result.isRight) {
          emit(
            state.copyWith(
              topMakes: [...state.topMakes, ...result.right.results],
              next: result.right.next,
              statusTop: FormzStatus.submissionSuccess,
            ),
          );
        } else {
          emit(state.copyWith(statusTop: FormzStatus.submissionFailure));
        }
      }
    });

    on<_GetSerched>((event, emit) => emit(state.copyWith(search: event.naem)));

    on<_SelectedCarItems>((event, emit) {
      emit(state.copyWith(
          selectId: event.makeEntity.id,
          selectedMake: event.makeEntity));
    });

    on<_ConfirmCarOption>((event, emit) {
      emit(state.copyWith(confirmId: state.selectId));
    });

    on<_RevertCarOption>((event, emit) {
      emit(state.copyWith(selectId: state.confirmId));
    });

    on<_ChangeControlleStatus>((event, emit) {
      emit(state.copyWith(statusController: FormzStatus.pure));
    });

    on<_GetIndex>((event, emit) {
      emit(state.copyWith(selectChar: event.index));
      final index = state.makes.indexWhere((element) =>
          element.name.toLowerCase().startsWith(event.index.toLowerCase()));
      if (index >= 0) {
        emit(state.copyWith(
            index: index, statusController: FormzStatus.submissionSuccess));
      }
    });
  }
}
