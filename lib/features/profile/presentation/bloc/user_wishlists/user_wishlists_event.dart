part of 'user_wishlists_bloc.dart';

@freezed
class UserWishListsEvent {}

class GetUserFavoritesEvent extends UserWishListsEvent {
  final String endpoint;
  GetUserFavoritesEvent({
    required this.endpoint
  });
}

class GetUserMyAdsEvent extends UserWishListsEvent {
  final String endpoint;
  GetUserMyAdsEvent({
    required this.endpoint
  });
}

class GetUserHistoryEvent extends UserWishListsEvent {
  final String endpoint;
  GetUserHistoryEvent({
    required this.endpoint
  });
}
