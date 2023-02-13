part of 'wishlist_add_bloc.dart';

@Freezed()
class WishlistAddState with _$WishlistAddState {
  factory WishlistAddState({
    @Default(-1) int goToAds,
    @Default(FormzStatus.pure) FormzStatus addStatus,
    @Default(FormzStatus.pure) FormzStatus removeStatus,
    @Default(-1) int index,
    @Default(-1) int id,
    @Default({}) Map<int, bool> map,
  }) = _WishlistAddState;
}
