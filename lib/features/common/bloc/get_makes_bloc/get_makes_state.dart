part of 'get_makes_bloc.dart';

class GetMakesState extends Equatable {
  FormzStatus status;
  List<MakeEntity> makes;
  String? next;
  int? goToIndex;
  String? selectChar;
  MakeEntity? selectedMake;
  String? name;

  GetMakesState({
    required this.status,
    this.selectedMake,
    this.goToIndex,
    this.next,
    this.name,
    this.makes = const <MakeEntity>[],
    this.selectChar,
  });

  GetMakesState copyWith({
    FormzStatus? status,
    List<MakeEntity>? makes,
    String? next,
    int? goToIndex,
    String? selectChar,
    MakeEntity? selectedMake,
    String? name,
  }) =>
      GetMakesState(
        status: status ?? this.status,
        makes: makes ?? this.makes,
        next: next != null && next.isEmpty ? null : next ?? this.next,
        goToIndex: goToIndex,
        selectChar: selectChar ?? this.selectChar,
        selectedMake:
            selectedMake?.id == -1 ? null : selectedMake ?? this.selectedMake,
        name: name ?? this.name,
      );

  @override
  List<Object?> get props => [
        status,
        makes,
        next,
        goToIndex,
        selectChar,
        selectedMake,
        name,
      ];
}
