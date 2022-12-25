part of 'get_gearboxes_bloc.dart';

class GetGearboxesState extends Equatable {
  final FormzStatus status;
  final List gearBoxes;
  const GetGearboxesState({required this.gearBoxes, required this.status});
  GetGearboxesState copyWith({FormzStatus? status, List? gearBoxes}) =>
      GetGearboxesState(
        gearBoxes: gearBoxes ?? this.gearBoxes,
        status: status ?? this.status,
      );
  @override
  List<Object?> get props => [
        status,
        gearBoxes,
      ];
}
