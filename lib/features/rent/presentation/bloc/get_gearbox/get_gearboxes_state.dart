part of 'get_gearboxes_bloc.dart';

class GetGearboxesState extends Equatable {
  final int selected;
  final FormzStatus status;
  final List<GearboxTypeEntity> gearBoxes;
  const GetGearboxesState(
      {required this.gearBoxes, required this.status, this.selected = -1});
  GetGearboxesState copyWith(
          {FormzStatus? status,
          List<GearboxTypeEntity>? gearBoxes,
          int? selected}) =>
      GetGearboxesState(
        selected: selected ?? this.selected,
        gearBoxes: gearBoxes ?? this.gearBoxes,
        status: status ?? this.status,
      );
  @override
  List<Object?> get props => [
        status,
        gearBoxes,
        selected,
      ];
}
