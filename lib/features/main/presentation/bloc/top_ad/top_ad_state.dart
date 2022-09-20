part of 'top_ad_bloc.dart';


@Freezed()
class TopAdState with _$TopAdState {
  factory TopAdState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<AdModel> topAds,
    @Default('') String next,
    @Default(0) int count,
})=_TopAdState;
}

