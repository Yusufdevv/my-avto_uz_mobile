part of 'instpection_place_bloc.dart';

abstract class InstpectionPlaceEvent {}

class InstpectionPlaceGetRegionsEvent extends InstpectionPlaceEvent {}

class InstpectionPlaceGetDistrictsEvent extends InstpectionPlaceEvent {
  final int regionId;
  InstpectionPlaceGetDistrictsEvent({required this.regionId});
}

class InstpectionPlaceGetCitiesEvent extends InstpectionPlaceEvent {}
