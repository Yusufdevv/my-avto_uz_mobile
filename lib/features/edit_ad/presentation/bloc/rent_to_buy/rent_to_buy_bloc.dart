import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

part 'rent_to_buy_event.dart';
part 'rent_to_buy_state.dart';

class RentToBuyBloc extends Bloc<RentToBuyEvent, RentToBuyState> {
  RentToBuyBloc()
      : super(RentToBuyState(
            focusNode: FocusNode(),
            step: 1,
            title: 'Предоплата',
            controller: TextEditingController())) {
    on<RentToBuyEvent>((event, emit) {
      emit(
        state.copyWith(
          focusNode: FocusNode()..requestFocus(),
          title: event.title,
          minimumSumma: event.minimumMonthlyPay,
          prepayment: event.prepayment,
          rentalPeriod: event.rentalPeriod,
          monthlyPayment: event.monthlyPayment,
          step: event.step,
          controller: event.controller,
        ),
      );
    });
  }
}
