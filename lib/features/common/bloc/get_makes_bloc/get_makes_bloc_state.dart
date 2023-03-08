part of 'get_makes_bloc_bloc.dart';

@Freezed()
class GetMakesState with _$GetMakesState {
  factory GetMakesState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus statusTop,
    @Default(FormzStatus.pure) FormzStatus statusController,
    @Default([]) List<MakeEntity> makes,
    @Default([]) List<MakeEntity> topMakes,
    @Default('') String? next,
    @Default(false) bool ischeck,
    @Default(GetMakeParam()) GetMakeParam search,
    @Default(0) count,
    @Default(0) int index,
    @Default('A') String selectChar,
    @Default(-1) int selectId,
    @Default(MakeEntity()) selectedMake,
    @Default(0) int confirmId,
    @Default('') String name,
    @Default('') String imageUrl,
  }) = _GetMakesState;
}
