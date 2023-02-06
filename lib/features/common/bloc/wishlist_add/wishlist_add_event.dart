part of 'wishlist_add_bloc.dart';

@Freezed()
class WishlistAddEvent with _$WishlistAddEvent {
  factory WishlistAddEvent.addWishlist(int id, int index) = _AddWishlist;

  factory WishlistAddEvent.removeWishlist(int id, int index) = _RemoveWishlist;

  factory WishlistAddEvent.clearState() = _ClearState;
  factory WishlistAddEvent.goToAdds(int  goToAds) = _GoToAds;
}
