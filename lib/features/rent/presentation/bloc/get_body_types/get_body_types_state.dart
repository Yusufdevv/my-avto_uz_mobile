part of 'get_body_types_bloc.dart';

class GetBodyTypesState extends Equatable {
  final int selected;
  final FormzStatus status;
  final List<BodyTypeEntity> bodyTypes;
  const GetBodyTypesState({
    required this.status,
    required this.bodyTypes,
    this.selected = -1,
  });
  GetBodyTypesState copyWith({
    FormzStatus? status,
    List<BodyTypeEntity>? bodyTypes,
    int? selected,
  }) =>
      GetBodyTypesState(
          selected: selected ?? this.selected,
          status: status ?? this.status,
          bodyTypes: bodyTypes ?? this.bodyTypes);

  @override
  List<Object?> get props => [status, selected, bodyTypes];
}
