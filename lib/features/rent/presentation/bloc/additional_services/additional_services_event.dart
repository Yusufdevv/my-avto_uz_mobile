part of 'additional_services_bloc.dart';

abstract class AdditionalServicesEvent {}

class GetAdditionalServicesEvent extends AdditionalServicesEvent {}

class CheckUncheckEvent extends AdditionalServicesEvent {
  final bool value;
  final int index;
  CheckUncheckEvent({required this.index,required this.value});
}
