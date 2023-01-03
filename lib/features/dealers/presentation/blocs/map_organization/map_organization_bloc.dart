import 'dart:async';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/dealers/domain/entities/map_parameter.dart';
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

class MapOrganizationBloc extends Bloc<MapOrganizationEvent, MapOrganizationState> {
  final GetMapDealersUseCase getDealers;
  MapOrganizationBloc(this.getDealers)
      : super(MapOrganizationState()) {
    on<_GetDealers>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getDealers('',
          param: MapParameter(
              lat: event.latitude ?? state.lat,
              long: event.longitude ?? state.long,
              radius: event.radius?.floor() ?? state.radius));
      if (result.isRight) {
        emit(state.copyWith(dealers: result.right, status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_ChangeRadius>((event, emit) {
      emit(state.copyWith(radius: event.radius));
    });

    on<_ChangeLatLong>((event, emit) {
      if (event.radius != null) {
        emit(state.copyWith(lat: event.lat, long: event.long, radius: event.radius!));
      } else {
        emit(state.copyWith(lat: event.lat, long: event.long));
      }
    }, transformer: debounce(const Duration(milliseconds: 300)));
    on<_GetCurrentLocation>((event, emit) async {
      emit(state.copyWith(getCurrentLocationStatus: FormzStatus.submissionInProgress));
      try {
        final position = await MyFunctions.determinePosition();
        emit(state.copyWith(getCurrentLocationStatus: FormzStatus.submissionSuccess));
        event.onSuccess(position);
      } on ParsingException catch (e) {
        event.onError(e.errorMessage);
        emit(state.copyWith(getCurrentLocationStatus: FormzStatus.submissionSuccess));
      }
    });
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
          (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}