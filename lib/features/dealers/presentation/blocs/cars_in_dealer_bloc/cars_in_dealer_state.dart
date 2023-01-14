part of 'cars_in_dealer_bloc.dart';

@Freezed()
class CarsInDealerState with _$CarsInDealerState {
  factory CarsInDealerState({
    @Default([]) List<CarsInDealerEntity> cars,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _CarsInDealerState;
}