part of 'search_result_bloc.dart';

@Freezed()
class SearchResultState with _$SearchResultState {
  factory SearchResultState({
    @Default([]) List<AutoEntity> list,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus paginationStatus,
    String? next,
    @Default(0) int count,
  }) = _SearchResultState;
}
