part of 'dealer_card_bloc.dart';


@Freezed()
class DealerCardState with _$DealerCardState {
  factory DealerCardState({
    @Default([]) List<DealerCardEntity> dealerCardEntity,
    @Default(FormzStatus.pure)FormzStatus status ,
}) =_DealerCardState;



}
