part of 'user_wishlists_notification_bloc.dart';

class UserWishListsEvent {}

class GetUserFavoritesEvent extends UserWishListsEvent {
  GetUserFavoritesEvent();
}

class GetUserMyAdsEvent extends UserWishListsEvent {
  final String moderationStatus;
  GetUserMyAdsEvent({required this.moderationStatus});
}

class GetMoreUserMyAdsEvent extends UserWishListsEvent {
  final String moderationStatus;

  GetMoreUserMyAdsEvent({required this.moderationStatus});
}

class GetMySearchesEvent extends UserWishListsEvent {}

class NotificationAllReadEvent extends UserWishListsEvent {}

class ChangeIsWishEvenet extends UserWishListsEvent {
  final int index;
  final int id;
  bool isAddWish;
  bool isRemoveWish;
  ChangeIsWishEvenet(
      {required this.index,
      required this.id,
      this.isAddWish = false,
      this.isRemoveWish = false});
}

class DeleteMySearchesEvent extends UserWishListsEvent {
  final List<int> ids;
  DeleteMySearchesEvent({required this.ids});
}

class GetNotificationSingleEvent extends UserWishListsEvent {
  final String id;
  GetNotificationSingleEvent({required this.id});
}

class ChangeReadEvent extends UserWishListsEvent {
  final int index;
  ChangeReadEvent({required this.index});
}

class GetNotificationsEvent extends UserWishListsEvent {
  int? filter;
  GetNotificationsEvent({this.filter});
}

class GetMoreNotificationsEvent extends UserWishListsEvent {}
