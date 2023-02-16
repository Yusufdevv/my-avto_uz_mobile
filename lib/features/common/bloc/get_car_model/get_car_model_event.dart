part of 'get_car_model_bloc.dart';

@Freezed()
class GetCarModelEvent with _$GetCarModelEvent {
  factory GetCarModelEvent.getCarModel({required int getId, required String search}) = _GetCarModel;
  factory GetCarModelEvent.getMakeId(int id) = _GetMakeId;
  factory GetCarModelEvent.selectedModelItem(
      {required MakeEntity model,
      required int selectedId}) = _SelectedModelItem;
  factory GetCarModelEvent.confirmModel() = _ConfirmModel;
  factory GetCarModelEvent.revertModel() = _RevertModel;
}
