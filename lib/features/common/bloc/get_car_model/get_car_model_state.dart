part of 'get_car_model_bloc.dart';

@Freezed()
class GetCarModelState with _$GetCarModelState {
  factory GetCarModelState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(<MakeEntity>[]) List<MakeEntity> models,
    @Default('') next,
    @Default(0) int getId,
    @Default(0) count,
    @Default(0) announcementCount,
    @Default(FormzStatus.pure) FormzStatus getAnnouncementStatus,
    @Default(0) selectedId,
    @Default(0) confirmId,
    @Default('') String name,
    @Default(MakeEntity()) MakeEntity selectedModel,
  }) = _GetCarModelState;
}
