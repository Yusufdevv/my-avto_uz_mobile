part of 'rent_bloc.dart';

@Freezed()
class RentState with _$RentState {
  factory RentState({
    @Default([]) List<RentMainEntity> list,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus paginationStatus,
    String? next,
    @Default(0) int count,
  }) = _RentState;
}
