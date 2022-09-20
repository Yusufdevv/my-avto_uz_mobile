part of 'top_brand_bloc.dart';

@Freezed()
class TopBrandState with _$TopBrandState {
  factory TopBrandState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<TopBrandModel> brands,
    String? next,
    @Default(0) int count,
  }) = _TopBrandState;
}
