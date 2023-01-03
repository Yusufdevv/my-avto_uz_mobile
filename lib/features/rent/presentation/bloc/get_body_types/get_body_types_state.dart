part of 'get_body_types_bloc.dart';

class GetBodyTypesState extends Equatable {
  final FormzStatus status;
  final List<BodyTypeEntity> bodyTypes;
  const GetBodyTypesState({required this.status, required this.bodyTypes});
  GetBodyTypesState copyWith({
    FormzStatus? status,
    List<BodyTypeEntity>? bodyTypes,
  }) =>
      GetBodyTypesState(
          status: status ?? this.status,
          bodyTypes: bodyTypes ?? this.bodyTypes);

  @override
  List<Object?> get props => [status];
}
