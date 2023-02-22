part of 'user_single_bloc.dart';

@Freezed()
class UserSingleEvent with _$UserSingleEvent {
  factory UserSingleEvent.getUserSingle({
    required int userId,
    required int announcementId,
  }) = _GetUserSingle;
  factory UserSingleEvent.getUserAds({required int userId}) = _GetUserAds;
}
