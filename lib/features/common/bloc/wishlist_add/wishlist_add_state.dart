part of 'wishlist_add_bloc.dart';

@Freezed()
class WishlistAddState with _$WishlistAddState {
  factory WishlistAddState({
    @Default(FormzStatus.pure) FormzStatus addStatus,
    @Default(FormzStatus.pure) FormzStatus removeStatus,
  }) = _WishlistAddState;
}
