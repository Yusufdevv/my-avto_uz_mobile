part of 'commercial_bloc.dart';

@Freezed()
class CommercialState with _$CommercialState {
  factory CommercialState({
    @Default([]) List<RentMainEntity> list,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus paginationStatus,
    String? next,
    @Default(0) int count,
  }) = _CommercialState;
}
