part of 'user_wishlists_bloc.dart';

class UserWishListsState extends Equatable {
  final List<AutoEntity> favorites;
  final List<AutoEntity> myAds;
  final FormzStatus favoritesStatus;
  final FormzStatus myAdsStatus;

  const UserWishListsState({
    required this.favoritesStatus,
    required this.myAdsStatus,
    required this.favorites,
    required this.myAds,
  });

  UserWishListsState copyWith({
    List<AutoEntity>? favorites,
    List<AutoEntity>? myAds,
    FormzStatus? favoritesStatus,
    FormzStatus? myAdsStatus,
  }) =>
      UserWishListsState(
        favorites: favorites ?? this.favorites,
        myAds: myAds ?? this.myAds,
        favoritesStatus: favoritesStatus ?? this.favoritesStatus,
        myAdsStatus: myAdsStatus ?? this.myAdsStatus,
      );

  @override
  List<Object?> get props => [favorites, myAds, favoritesStatus, myAdsStatus];
}
