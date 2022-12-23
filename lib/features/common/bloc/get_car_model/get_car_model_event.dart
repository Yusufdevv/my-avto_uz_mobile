part of 'get_car_model_bloc.dart';

@Freezed()
class GetCarModelEvent with _$GetCarModelEvent {
  const factory GetCarModelEvent.getCarModel(CarModelParams? getModel) = _GetCarModel;
}