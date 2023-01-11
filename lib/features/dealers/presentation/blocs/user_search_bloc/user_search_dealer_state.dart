part of 'user_search_dealer_bloc.dart';

@Freezed()
class UserSearchDealerState with _$UserSearchDealerState {
  factory UserSearchDealerState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<UserSearchesDealerEntity> userSearches,
    @Default('') String? next,
    @Default('') String? previous,
    @Default(0) int count,
  }) = _UserSearchDealerState;
}
