part of 'get_car_model_bloc.dart';

@Freezed()
class GetCarModelState with _$GetCarModelState {
  factory GetCarModelState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(GetMakeEntity()) GetMakeEntity model,
    @Default('') next,
    @Default(CarModelParams()) CarModelParams getModel,
    @Default(0) count,
  }) = _GetCarModelState;
}
