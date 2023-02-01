part of 'user_single_bloc.dart';

@Freezed()
class UserSingleState with _$UserSingleState {
  factory UserSingleState({
    @Default(UserSingleEntity()) UserSingleEntity userSingleEntity,
    @Default([]) List<AutoEntity> userAds,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _UserSingleState;
}