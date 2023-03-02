import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

part 'rent_to_buy_event.dart';

part 'rent_to_buy_state.dart';

class RentToBuyBloc extends Bloc<RentToBuyEvent, RentToBuyState> {
  RentToBuyBloc(RentWithPurchaseEntity? entityForEdit)
      : super(RentToBuyState(
            entityForEdit: entityForEdit,
            focusNode: FocusNode(),
            step: 1,
            title: StorageRepository.getString('language')=='ru' ? 'Предоплата' : "Oldindan to'lov",
            controller: TextEditingController(
                text: MyFunctions.getFormatCost(
                    entityForEdit?.prepayment ?? '')))) {
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
