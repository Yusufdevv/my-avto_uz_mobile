part of 'dealer_card_bloc.dart';

@Freezed()
class DealerCardState with _$DealerCardState {
  factory DealerCardState({
    @Default([]) List<DealerCardEntity> list,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus paginationStatus,
    @Default(MakeEntity()) MakeEntity maker,
    @Default([]) List<Region> region,
    @Default('') String carType,
    String? next,
    @Default(0) int count,
  }) = _DealerCardState;
}
