import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rent_to_buy_event.dart';
part 'rent_to_buy_state.dart';

class RentToBuyBloc extends Bloc<RentToBuyEvent, RentToBuyState> {
  RentToBuyBloc() : super(const RentToBuyState(step: 1, title: 'Предоплата')) {
    on<RentToBuyEvent>((event, emit) {
      emit(
        state.copyWith(
          title: event.title,
          minimumSumma: event.minimumSumma,
          month: event.month,
          monthlyPay: event.monthlyPay,
          startingPay: event.startingPay,
          step: event.step,
        ),
      );
    });
  }
}
