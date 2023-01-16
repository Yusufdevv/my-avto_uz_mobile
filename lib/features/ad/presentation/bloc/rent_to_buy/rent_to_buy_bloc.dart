import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'rent_to_buy_event.dart';
part 'rent_to_buy_state.dart';

class RentToBuyBloc extends Bloc<RentToBuyEvent, RentToBuyState> {
  RentToBuyBloc()
      : super(RentToBuyState(
            step: 1,
            title: 'Предоплата',
            controller: TextEditingController())) {
    on<RentToBuyEvent>((event, emit) {
      emit(
        state.copyWith(
          title: event.title,
          minimumSumma: event.minimumSumma,
          month: event.month,
          monthlyPay: event.monthlyPay,
          startingPay: event.startingPay,
          step: event.step,
          controller: event.controller,
        ),
      );
    });
  }
}
