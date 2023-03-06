import 'dart:async';

import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
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
            getPointNameStatus: FormzStatus.pure,
            getCurrentLocationStatus: FormzStatus.pure,
            status: FormzStatus.pure)) {
    on<MapGetCurrentLocationEvent>(_getCurrentLocation);
    on<MapChangeLatLongEvent>(_changeLongLat);
    on<GetPointName>(_getPointName);
  }

  FutureOr<void> _getPointName(
      GetPointName event, Emitter<MapState> emit) async {
    emit(state.copyWith(getPointNameStatus: FormzStatus.submissionInProgress));
    await StorageRepository.putDouble(StorageKeys.LATITUDE, event.lat);
    await StorageRepository.putDouble(StorageKeys.LONGITUDE, event.long);

    final result = await useCase
        .call({'type': 'geo', 'long': '${event.long}', 'lat': '${event.lat}'});
    if (result.isRight) {
      emit(state.copyWith(
          getPointNameStatus: FormzStatus.submissionSuccess,
          address: MyFunctions.extractAddress(result.right)));
    }
  }

  FutureOr<void> _changeLongLat(
      MapChangeLatLongEvent event, Emitter<MapState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    add(GetPointName(long: event.long, lat: event.lat));
    if (event.radius == null) {
      emit(
        state.copyWith(
          lat: event.lat,
          long: event.long,
          status: FormzStatus.submissionSuccess,
        ),
      );
    } else {
      emit(
        state.copyWith(
          lat: event.lat,
          long: event.long,
          radius: event.radius!,
          status: FormzStatus.submissionSuccess,
        ),
      );
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
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      event.onError(e.toString());
      emit(state.copyWith(
          getCurrentLocationStatus: FormzStatus.submissionSuccess));
    }
  }
}
