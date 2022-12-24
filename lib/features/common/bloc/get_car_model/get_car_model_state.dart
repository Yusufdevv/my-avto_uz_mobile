part of 'get_car_model_bloc.dart';

@Freezed()
class GetCarModelState with _$GetCarModelState {
  factory GetCarModelState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(GetMakeEntity()) GetMakeEntity model,
    @Default('') next,
    @Default('') search,
    @Default(0) int getId,
    @Default(0) count,
  }) = _GetCarModelState;
}
