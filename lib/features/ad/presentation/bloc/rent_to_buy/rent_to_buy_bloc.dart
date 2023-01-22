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
            step: 1,
            title: 'Предоплата',
            controller: TextEditingController())) {
    on<RentToBuyEvent>((event, emit) {
      print(
          '=> => => => event controller :  ${event.controller}    <= <= <= <=');
      print(
          '=> => => => event  minimumSumma:  ${event.minimumMonthlyPay}    <= <= <= <=');
      print('=> => => => event month:   ${event.rentalPeriod}    <= <= <= <=');
      print(
          '=> => => => event monthlyPayment:   ${event.monthlyPayment}    <= <= <= <=');
      print(
          '=> => => => event prepayment:   ${event.prepayment}    <= <= <= <=');
      print('=> => => => event step:   ${event.step}    <= <= <= <=');
      print('=> => => => event title:   ${event.title}    <= <= <= <=');
      emit(
        state.copyWith(
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
