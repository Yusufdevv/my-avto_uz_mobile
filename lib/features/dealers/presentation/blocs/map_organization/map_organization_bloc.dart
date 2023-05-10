import 'dart:developer';

import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/common/usecases/yandex_get_address_use_case.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/dealers/data/models/map_model.dart';
import 'package:auto/features/dealers/domain/entities/map_entity.dart';
import 'package:auto/features/dealers/domain/entities/map_parameter.dart';
import 'package:auto/features/dealers/domain/usecases/get_directories_map_point_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/get_map_dealers.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

part 'map_organization_event.dart';

part 'map_organization_state.dart';

part 'map_organization_bloc.freezed.dart';

class MapOrganizationBloc
    extends Bloc<MapOrganizationEvent, MapOrganizationState> {
  final GetMapDealersUseCase getDealers;

  YandexGetAddressUseCase getAddressUseCase = YandexGetAddressUseCase();
  final GetDirectoriesMapPointUseCase getDirectoriesMapPointUseCase;
  final bool isFromDirectoryPage;

  MapOrganizationBloc({
    required this.getDealers,
    required this.getDirectoriesMapPointUseCase,
    required this.isFromDirectoryPage,
  }) : super(MapOrganizationState()) {
    on<_GetAddressOfDealler>((event, emit) async {
      log(':::::::::: Get adress of dealler triggered: ${event.currentDealer}  ::::::::::');
      String? address;
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getAddressUseCase.call(
          {'type': 'geo', 'long': '${event.long}', 'lat': '${event.lat}'});
      log('::::::::::  $result  ::::::::::');
      if (result.isRight) {
        address = MyFunctions.extractAddress(result.right);
      }
      emit(state.copyWith(
          address: address,
          status: FormzStatus.submissionSuccess,
          currentDealer: event.currentDealer));
    });
    on<_GetSwitchedIsAdDealler>(
        (event, emit) => emit(state.copyWith(isAdDealler: event.value)));
    on<_GetDealers>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getDealers(state.searchText,
          param: MapParameter(
              lat: event.latitude ?? state.lat,
              long: event.longitude ?? state.long,
              radius: event.radius?.floor() ?? state.radius));

      if (result.isRight) {
        var iconizedDeallers = result.right
            .map((e) => e.iconize(iconPath: AppIcons.dealersLocIcon))
            .toList()
          ..add(MapEntity(
              id: -1,
              iconPath: AppIcons.currentLoc,
              latitude: state.lat,
              longitude: state.long));

        emit(state.copyWith(
            isAdDealler: true,
            dealers: iconizedDeallers,
            status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<_GetDirectoriesPoints>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getDirectoriesMapPointUseCase(state.searchText,
          param: MapParameter(
              lat: event.latitude ?? state.lat,
              long: event.longitude ?? state.long,
              radius: event.radius?.floor() ?? state.radius));
      if (result.isRight) {
        var iconizedDirectories = result.right
            .map((e) => e.iconize(iconPath: AppIcons.directoryPoint))
            .toList();
        emit(state.copyWith(
            directoriesPoints: iconizedDirectories,
            status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<_ChangeLatLong>((event, emit) {
      // add(_GetAddressOfDealler(lat: event.lat, long: event.long, currentDealer:const MapEntity()));
      if (event.radius != null) {
        emit(state.copyWith(
            lat: event.lat, long: event.long, radius: event.radius!));
      } else {
        emit(state.copyWith(lat: event.lat, long: event.long));
      }
    }, transformer: debounce(const Duration(milliseconds: 300)));
    on<_GetCurrentLocation>((event, emit) async {
      emit(state.copyWith(
          getCurrentLocationStatus: FormzStatus.submissionInProgress));
      try {
        final position = await MyFunctions.determinePosition();
        List<MapEntity> points = [];

        points = isFromDirectoryPage
            ? state.directoriesPoints.map((e) => e).toList()
            : state.dealers.map((e) => e).toList();
        final currentLocIndex =
            points.indexWhere((element) => element.id == -1);
        if (currentLocIndex != -1) {
          points.removeAt(currentLocIndex);
        }
        points.add(MapEntity(
            id: -1,
            iconPath: AppIcons.currentLoc,
            latitude: position.latitude,
            longitude: position.longitude));
        emit(
          state.copyWith(
            isAdDealler: true,
            getCurrentLocationStatus: FormzStatus.submissionSuccess,
            dealers: isFromDirectoryPage ? [] : points,
            directoriesPoints: isFromDirectoryPage ? points : [],
          ),
        );
        event.onSuccess(position);
      } on ParsingException catch (e) {
        event.onError(e.errorMessage);
        emit(state.copyWith(
            getCurrentLocationStatus: FormzStatus.submissionSuccess));
      }
    });

    on<_SetMapPoints>((event, emit) {
      emit(state.copyWith(
          dealers:
              event.list.map((e) => MapModel.fromJson(e.toJson())).toList()));
    });
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
