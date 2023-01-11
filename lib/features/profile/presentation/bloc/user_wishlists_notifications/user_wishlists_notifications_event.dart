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

class GetMySearchesEvent extends UserWishListsEvent {}

class NotificationAllReadEvent extends UserWishListsEvent {}

class DeleteMySearchesEvent extends UserWishListsEvent {
    final String id;
  DeleteMySearchesEvent({required this.id});
}

class GetNotificationSingleEvent extends UserWishListsEvent {
  final String id;
  GetNotificationSingleEvent({required this.id});
}

class GetNotificationsEvent extends UserWishListsEvent {}
