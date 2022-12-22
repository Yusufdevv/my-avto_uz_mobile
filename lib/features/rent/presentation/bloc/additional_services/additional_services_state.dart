part of 'additional_services_bloc.dart';

class AdditionalServicesState extends Equatable {
  final List<AdditionalServiceEntity> services;
  final FormzStatus status;
  const AdditionalServicesState({required this.status, required this.services});
  AdditionalServicesState copyWith(
          {List<AdditionalServiceEntity>? services, FormzStatus? status}) =>
      AdditionalServicesState(
        services: services ?? this.services,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [services, status];
}
