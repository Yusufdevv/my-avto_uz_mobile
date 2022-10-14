part of 'rent_list_bloc.dart';

@Freezed()
class RentListState with _$RentListState {
  factory RentListState({
    @Default([]) List<RentListEntity> list,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus paginationStatus,
    String? next,
    @Default(0) int count,
  }) = _RentListState;
}
