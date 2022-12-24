part of 'get_car_model_bloc.dart';

@Freezed()
class GetCarModelEvent with _$GetCarModelEvent {
  factory GetCarModelEvent.getCarModel(int getId) = _GetCarModel;
  factory GetCarModelEvent.getMakeId(int id) = _GetMakeId;
  factory GetCarModelEvent.getSerched(String naem) = _GetSerched;
}