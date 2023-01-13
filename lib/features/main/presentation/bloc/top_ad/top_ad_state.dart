part of 'top_ad_bloc.dart';

@Freezed()
class TopAdState with _$TopAdState {
  factory TopAdState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus favoritesStatus,
    @Default([]) List<AdModel> topAds,
    @Default([]) List<AutoEntity> favorites,
    @Default('') String next,
    @Default(0) int count,
  }) = _TopAdState;
}
