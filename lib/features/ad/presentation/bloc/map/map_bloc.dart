import 'dart:async';

import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/common/usecases/yandex_get_address_use_case.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:geolocator/geolocator.dart';

part 'map_event.dart';

part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  YandexGetAddressUseCase useCase = YandexGetAddressUseCase();

  MapBloc()
      : super(const MapState(
            getCurrentLocationStatus: FormzStatus.pure,
            status: FormzStatus.pure)) {
    on<MapGetCurrentLocationEvent>(_getCurrentLocation);
    on<MapChangeLatLongEvent>(_changeLongLat);
  }

  FutureOr<void> _changeLongLat(
      MapChangeLatLongEvent event, Emitter<MapState> emit) async {
    var address = '';
    final res = await useCase.call({'type': 'geo', 'long': '${event.long}', 'lat' : '${event.lat}'});
    if(res.isRight) {
      try {
        address =
        '${res.right.features[6].properties.name}, ${res.right.features[4].properties.name}, ${res
            .right.features[0].properties.name}';
      } catch (e) {
        print(e);
      }
    }
    if (event.radius == null) {
      emit(state.copyWith(lat: event.lat, long: event.long, address: address));
    } else {
      emit(state.copyWith(
          lat: event.lat, long: event.long, radius: event.radius!, address: address));
    }
  }

  FutureOr<void> _getCurrentLocation(
      MapGetCurrentLocationEvent event, Emitter<MapState> emit) async {
    emit(state.copyWith(
        getCurrentLocationStatus: FormzStatus.submissionInProgress));
    try {
      final position = await MyFunctions.determinePosition();
      emit(state.copyWith(
          getCurrentLocationStatus: FormzStatus.submissionSuccess));
      event.onSuccess(position);
    } on ParsingException catch (e) {
      event.onError(e.errorMessage);
      emit(state.copyWith(
          getCurrentLocationStatus: FormzStatus.submissionSuccess));
    }
  }
}
