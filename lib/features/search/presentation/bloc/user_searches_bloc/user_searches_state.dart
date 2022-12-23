part of 'user_searches_bloc.dart';

@Freezed()
class UserSearchesState with _$UserSearchesState {
  factory UserSearchesState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<UserSearchesEntity> userSearches,
    @Default([]) List<PopularSearchEntity> popularSearches,
    @Default('') String? next,
    @Default('') String? previous,
    @Default(0) int count,
  }) = _UserSearchesState;
}
