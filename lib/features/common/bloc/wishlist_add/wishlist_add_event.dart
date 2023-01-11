part of 'wishlist_add_bloc.dart';

@Freezed()
class WishlistAddEvent with _$WishlistAddEvent {
  factory WishlistAddEvent.addWishlist(int id, int index) = _AddWishlist;

  factory WishlistAddEvent.removeWishlist(int id, index) = _RemoveWishlist;

  factory WishlistAddEvent.clearState() = _ClearState;
}
