part of 'user_wishlists_notification_bloc.dart';

class UserWishListsState extends Equatable {
  List<AutoEntity> favorites;
  final List<AutoEntity> myAds;
  final List<NotificationsEntity> notifications;
  List<MySearchesEntity> mySearches;
  final NotificationsEntity notificationSingle;
  final FormzStatus favoritesStatus;
  final FormzStatus myAdsStatus;


    UserWishListsState({
    required this.favoritesStatus,
    required this.myAdsStatus,
    required this.favorites,
    required this.myAds,
    required this.mySearches,
    required this.notifications,
    required this.notificationSingle,
  });

  UserWishListsState copyWith({
    List<AutoEntity>? favorites,
    List<AutoEntity>? myAds,
    List<MySearchesEntity>? mySearches,
   List<NotificationsEntity>? notifications,
   NotificationsEntity? notificationSingle,
    FormzStatus? favoritesStatus,
    FormzStatus? myAdsStatus,
  }) =>
      UserWishListsState(
        favorites: favorites ?? this.favorites,
        myAds: myAds ?? this.myAds,
        mySearches: mySearches ?? this.mySearches,
        notificationSingle: notificationSingle ?? this.notificationSingle,
        notifications: notifications ?? this.notifications,
        favoritesStatus: favoritesStatus ?? this.favoritesStatus,
        myAdsStatus: myAdsStatus ?? this.myAdsStatus,
      );

  @override
  List<Object?> get props => [favorites, myAds,mySearches ,favoritesStatus, myAdsStatus, notificationSingle, notifications];
}
