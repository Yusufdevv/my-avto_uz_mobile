part of 'regions_bloc.dart';

@Freezed()
class RegionsState with _$RegionsState {
  factory RegionsState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<RegionEntity> regions,
  }) = _RegionsState;
}
