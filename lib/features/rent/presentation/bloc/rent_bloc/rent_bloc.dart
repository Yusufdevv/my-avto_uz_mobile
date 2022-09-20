import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/rent/domain/entities/rent_entity.dart';
import 'package:auto/features/rent/domain/usecases/rent_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'rent_event.dart';

part 'rent_state.dart';

class RentBloc extends Bloc<RentEvent, RentState> {
  final RentUseCase _getRentUseCase;

  RentBloc({required RentUseCase getRentUseCase})
      : _getRentUseCase = getRentUseCase,
        super(const RentState()) {
    on<RentEvent>((event, emit) async {
      emit(state.copyWith(status: PaginatorStatus.PAGINATOR_LOADING));
      final results = await _getRentUseCase.call(RentParams(query: 'query'));
      if(results.isRight){

      }
    });
  }
}
