part of 'get_makes_bloc_bloc.dart';

@Freezed()
class GetMakesState with _$GetMakesState {
  factory GetMakesState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(GetMakeEntity()) GetMakeEntity makes,
    @Default(-1) selected,
    @Default('') next,
    @Default('') search,
    @Default(0) count,
    @Default(-1) int selectedId,
    @Default(-1) int confirmId,
    @Default('') String name,
    @Default('') String imageUrl,
  }) = _GetMakesState;
}
