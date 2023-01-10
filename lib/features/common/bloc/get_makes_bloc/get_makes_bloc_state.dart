part of 'get_makes_bloc_bloc.dart';

@Freezed()
class GetMakesState with _$GetMakesState {
  factory GetMakesState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(GetMakeEntity()) GetMakeEntity makes,
    @Default(0) selected,
    @Default('') next,
    @Default('') search,
    @Default(0) count,
    @Default(0) int selectId,
    @Default(0) int confirmId,
    @Default('') String name,
    @Default('') String imageUrl,
  }) = _GetMakesState;
}
