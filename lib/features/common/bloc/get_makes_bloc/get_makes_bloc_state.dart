part of 'get_makes_bloc_bloc.dart';

class GetMakesState extends Equatable {
  FormzStatus status;
  FormzStatus statusTop;
  FormzStatus statusController;
  List<MakeEntity> makes;
  List<MakeEntity> topMakes;
  String? next;
  bool ischeck;
  GetPaginationParam search;
  int index;
  String? selectChar;
  int selectId;
  MakeEntity? selectedMake;
  int? confirmId;
  String? name;
  String? imageUrl;

  GetMakesState({
    required this.status,
    required this.statusController,
     this.selectedMake,
    this.index = -1,
    this.next,
    this.name,
    this.topMakes = const <MakeEntity>[],
    this.makes = const <MakeEntity>[],
    this.imageUrl,
    this.confirmId,
    this.ischeck = false,
    this.search = const GetPaginationParam(),
    this.selectChar,
    this.selectId = -1,
    this.statusTop = FormzStatus.pure,
  });

  GetMakesState copyWith({
    FormzStatus? status,
    FormzStatus? statusTop,
    FormzStatus? statusController,
    List<MakeEntity>? makes,
    List<MakeEntity>? topMakes,
    String? next,
    bool? ischeck,
    GetPaginationParam? search,
    int? index,
    String? selectChar,
    int? selectId,
    MakeEntity? selectedMake,
    int? confirmId,
    String? name,
    String? imageUrl,
  }) =>
      GetMakesState(
        status: status ?? this.status,
        statusTop: statusTop ?? this.statusTop,
        statusController: statusController ?? this.statusController,
        makes: makes ?? this.makes,
        topMakes: topMakes ?? this.topMakes,
        next: next ?? this.next,
        ischeck: ischeck ?? this.ischeck,
        search: search ?? this.search,
        index: index ?? this.index,
        selectChar: selectChar ?? this.selectChar,
        selectId: selectId ?? this.selectId,
        selectedMake: selectedMake ?? this.selectedMake,
        confirmId: confirmId ?? this.confirmId,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  @override
  List<Object?> get props => [
        status,
        statusTop,
        statusController,
        makes,
        topMakes,
        next,
        ischeck,
        search,
        index,
        selectChar,
        selectId,
        selectedMake,
        confirmId,
        name,
        imageUrl,
      ];
}
