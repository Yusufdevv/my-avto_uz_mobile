part of 'user_searches_bloc.dart';

@Freezed()
class UserSearchesEvent with _$UserSearchesEvent {
  factory UserSearchesEvent.getUserSearches({String? search}) =
      _GetUserSearches;
  factory UserSearchesEvent.getPopularSearches({String? search}) =
      _GetPopularSearches;
}
