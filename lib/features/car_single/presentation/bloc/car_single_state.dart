part of 'car_single_bloc.dart';

@Freezed()
class CarSingleState with _$CarSingleState {
  const factory CarSingleState({
    @Default(FormzStatus.pure) FormzStatus adsStatus,
    @Default(FormzStatus.pure) FormzStatus soldStatus,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default('') String succMessage,
    @Default('') String errorMessage,
    @Default(CarSingleEntity()) CarSingleEntity singleEntity,
    @Default([]) List<AutoEntity> elasticSearchEntity,
    @Default(false) fetchMore,
  }) = _CarSingleState;
}
