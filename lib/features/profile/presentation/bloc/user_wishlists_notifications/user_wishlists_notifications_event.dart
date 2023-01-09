part of 'user_wishlists_notification_bloc.dart';

class UserWishListsEvent {}

class GetUserFavoritesEvent extends UserWishListsEvent {
  final String endpoint;
  GetUserFavoritesEvent({required this.endpoint});
}

class GetUserMyAdsEvent extends UserWishListsEvent {
  final String endpoint;
  GetUserMyAdsEvent({required this.endpoint});
}

class GetUserHistoryEvent extends UserWishListsEvent {
  final String endpoint;
  GetUserHistoryEvent({required this.endpoint});
}

class GetNotificationSingleEvent extends UserWishListsEvent {
  final String id;
  GetNotificationSingleEvent({required this.id});
}

class GetNotificationsEvent extends UserWishListsEvent {}
