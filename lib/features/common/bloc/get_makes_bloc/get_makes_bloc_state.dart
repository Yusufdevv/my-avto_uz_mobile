part of 'get_makes_bloc_bloc.dart';

@freezed
class GetMakesState with _$GetMakesState {
  factory GetMakesState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(GetMakeEntity()) GetMakeEntity makes,
    @Default('') next,
    @Default(0) count,
  }) = _GetMakesState;
}
