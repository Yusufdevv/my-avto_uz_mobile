part of 'dealer_single_bloc.dart';

@Freezed()
class DealerSingleState with _$DealerSingleState {
  factory DealerSingleState({
    @Default(DealerSingleEntity()) DealerSingleEntity dealerSingleEntity,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _DealerSingleState;
}
