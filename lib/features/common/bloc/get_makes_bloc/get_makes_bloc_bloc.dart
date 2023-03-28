// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'dart:core';
import 'dart:developer';

import 'package:auto/features/ad/data/models/pagination/get_pagination_param_model.dart';
import 'package:auto/features/ad/domain/entities/generation/generation.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/domain/usecases/get_top_makes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'get_makes_bloc_event.dart';

part 'get_makes_bloc_state.dart';

class GetMakesBloc extends Bloc<GetMakesEvent, GetMakesState> {
  final GetMakesUseCase useCase = GetMakesUseCase();
  final GetTopMakesUseCase topUseCase = GetTopMakesUseCase();

  GetMakesBloc({int? initialId})
      : super(GetMakesState(
          selectId: initialId ?? -1,
          status: FormzStatus.pure,
          statusController: FormzStatus.pure,
        )) {
    on<GetMakesChangeSelectedMakeEvent>((event, emit) {
      emit(state.copyWith(selectId: event.makeId));
    });

    on<GetMakesSortMakesEvent>((event, emit) {
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

    on<GetMakesGetIsCheckEvent>((event, emit) => emit(state.copyWith(ischeck: true)));

    on<GetMakesGetEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(state.search);
      if (result.isRight) {
        emit(
          state.copyWith(
            makes: result.right.results,
            status: FormzStatus.submissionSuccess,
            next: result.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<GetMakesGetTopMakesEvent>((event, emit) async {
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

    on<GetMakesGetNextTopEvent>((event, emit) async {
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

    on<GetMakesGetSearchedEvent>((event, emit) => emit(state.copyWith(
        search: GetPaginationParam(name: event.name, limit: 1000, offset: 0))));

    on<GetMakesSelectedCarItemsEvent>((event, emit) {
      emit(state.copyWith(
          selectId: event.makeEntity.id, selectedMake: event.makeEntity));
    });

    on<GetMakesConfirmCarOptionEvent>((event, emit) {
      emit(state.copyWith(confirmId: state.selectId));
    });

    on<GetMakesRevertCarOptionEvent>((event, emit) {
      emit(state.copyWith(selectId: state.confirmId));
    });

    on<GetMakesChangeControlleStatusEvent>((event, emit) {
      emit(state.copyWith(statusController: FormzStatus.pure));
    });

    on<GetMakesGetIndexEvent>((event, emit) {
      final index = state.makes.indexWhere((element) =>
          element.name.toLowerCase().startsWith(event.index.toLowerCase()));

      emit(state.copyWith(
          selectChar: event.index,
          index: index,
          statusController: index > -1
              ? FormzStatus.submissionSuccess
              : FormzStatus.submissionFailure));
    });
  }
}
