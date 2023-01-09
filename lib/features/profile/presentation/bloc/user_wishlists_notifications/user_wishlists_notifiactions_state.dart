part of 'user_wishlists_notification_bloc.dart';

class UserWishListsState extends Equatable {
  final List<AutoEntity> favorites;
  final List<AutoEntity> myAds;
  final List<NotificationsEntity> notifications;
  final NotificationsEntity notificationSingle;
  final FormzStatus favoritesStatus;
  final FormzStatus myAdsStatus;

  const UserWishListsState({
    required this.favoritesStatus,
    required this.myAdsStatus,
    required this.favorites,
    required this.myAds,
    required this.notifications,
    required this.notificationSingle,
  });

  UserWishListsState copyWith({
    List<AutoEntity>? favorites,
    List<AutoEntity>? myAds,
    
   List<NotificationsEntity>? notifications,
   NotificationsEntity? notificationSingle,
    FormzStatus? favoritesStatus,
    FormzStatus? myAdsStatus,
  }) =>
      UserWishListsState(
        favorites: favorites ?? this.favorites,
        myAds: myAds ?? this.myAds,
        notificationSingle: notificationSingle ?? this.notificationSingle,
        notifications: notifications ?? this.notifications,
        favoritesStatus: favoritesStatus ?? this.favoritesStatus,
        myAdsStatus: myAdsStatus ?? this.myAdsStatus,
      );

  @override
  List<Object?> get props => [favorites, myAds, favoritesStatus, myAdsStatus, notificationSingle, notifications];
}