
import 'package:auto/features/common/usecases/yandex_get_address_use_case.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'inspection_place_address_event.dart';

part 'inspection_place_address_state.dart';

class InspectionPlaceAddressBloc
    extends Bloc<InspectionPlaceAddressEvent, InspectionPlaceAddressState> {
  YandexGetAddressUseCase getAddressUseCase = YandexGetAddressUseCase();

  InspectionPlaceAddressBloc()
      : super(const InspectionPlaceAddressState(
            status: FormzStatus.pure, address: '')) {
    ///
    on<GetAddressEvent>((event, emit) async {
      String? address;
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getAddressUseCase.call(
          {'type': 'geo', 'long': '${event.long}', 'lat': '${event.lat}'});
      if (result.isRight) {
        address = MyFunctions.extractAddress(result.right);
      }
      emit(state.copyWith(
          address: address, status: FormzStatus.submissionSuccess));
    });
  }
}
