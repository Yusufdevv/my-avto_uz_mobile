part of 'map_organization_bloc.dart';

@Freezed()
class MapOrganizationState with _$MapOrganizationState {
  factory MapOrganizationState({
    @Default(null) String? address,
    @Default([]) List<MapEntity> dealers,
    @Default(MapEntity()) MapEntity? currentDealer,
    @Default([]) List<MapEntity> directoriesPoints,
    @Default(0) int radius,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus getCurrentLocationStatus,
    @Default(0) double lat,
    @Default(0) double long,
    @Default(0) double currentLat,
    @Default(0) double currentLong,
    @Default('') String searchText,
    @Default(false) bool fetchMore,
    @Default(false) bool isAdDealler,
  }) = _MapOrganizationState;
}
