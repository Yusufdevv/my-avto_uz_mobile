part of 'user_search_dealer_bloc.dart';

@Freezed()
class UserSearchDealerEvent with _$UserSearchDealerEvent {
  factory UserSearchDealerEvent.getUserSearches({String? search}) =
  _GetUserSearches;
}
