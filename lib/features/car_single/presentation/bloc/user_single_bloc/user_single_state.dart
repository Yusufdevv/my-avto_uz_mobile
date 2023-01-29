part of 'user_single_bloc.dart';

@Freezed()
class UserSingleState with _$UserSingleState {
  factory UserSingleState({
    @Default(DealerSingleEntity()) DealerSingleEntity dealerSingleEntity,
    @Default([]) List<CarsInDealerEntity> cars,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _UserSingleState;
}