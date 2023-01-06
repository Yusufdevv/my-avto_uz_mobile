part of 'wishlist_add_bloc.dart';

@Freezed()
class WishlistAddEvent with _$WishlistAddEvent {
  factory WishlistAddEvent.addWishlist(int id) = _AddWishlist;

  factory WishlistAddEvent.removeWishlist(int id) = _RemoveWishlist;
}
