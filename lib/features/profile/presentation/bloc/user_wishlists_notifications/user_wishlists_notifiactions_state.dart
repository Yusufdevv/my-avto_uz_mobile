part of 'user_wishlists_notification_bloc.dart';

// ignore: must_be_immutable
class UserWishListsState extends Equatable {
  List<AutoEntity> favorites;
  final List<AutoEntity> myAds;
  final int count;
  final String nextMyAds;
  final bool moreFetchMyAds;
  final String nextNotifications;
  final bool moreFetchNotifications;
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
    required this.count,
    required this.nextMyAds,
    required this.moreFetchMyAds,
    required this.nextNotifications,
    required this.moreFetchNotifications,
  });

  UserWishListsState copyWith({
    List<AutoEntity>? favorites,
    List<AutoEntity>? myAds,
    List<MySearchesEntity>? mySearches,
    List<NotificationsEntity>? notifications,
    NotificationsEntity? notificationSingle,
    FormzStatus? favoritesStatus,
    FormzStatus? myAdsStatus,
    int? count,
    String? nextMyAds,
    bool? moreFetchMyAds,
    String? nextNotifications,
    bool? moreFetchNotifications,
  }) =>
      UserWishListsState(
        favorites: favorites ?? this.favorites,
        myAds: myAds ?? this.myAds,
        mySearches: mySearches ?? this.mySearches,
        notificationSingle: notificationSingle ?? this.notificationSingle,
        notifications: notifications ?? this.notifications,
        favoritesStatus: favoritesStatus ?? this.favoritesStatus,
        myAdsStatus: myAdsStatus ?? this.myAdsStatus,
        count: count ?? this.count,
        nextMyAds: nextMyAds ?? this.nextMyAds,
        moreFetchMyAds: moreFetchMyAds ?? this.moreFetchMyAds,
        nextNotifications: nextNotifications ?? this.nextNotifications,
        moreFetchNotifications: moreFetchNotifications ?? this.moreFetchNotifications,
      );

  @override
  List<Object?> get props => [
        favorites,
        myAds,
        mySearches,
        favoritesStatus,
        myAdsStatus,
        notificationSingle,
        notifications,
        count,
        moreFetchMyAds,
        nextMyAds,
        moreFetchNotifications, 
        nextNotifications
      ];
}
