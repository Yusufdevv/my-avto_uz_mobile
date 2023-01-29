part of 'user_single_bloc.dart';


@Freezed()
class UserSingleEvent with _$UserSingleEvent {
  factory UserSingleEvent.getUserSingle({required String slug}) = _GetUserSingle;
  factory UserSingleEvent.getUserAds({required String slug}) = _GetUserAds;
}
