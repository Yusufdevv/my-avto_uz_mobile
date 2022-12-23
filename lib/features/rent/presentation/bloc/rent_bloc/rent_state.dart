part of 'rent_bloc.dart';

class RentState extends Equatable {
  final List<RentMainEntity> list;
  final FormzStatus status;
  final FormzStatus paginationStatus;
  final String? next;
  final int count;
  final int categoryId;
  final int hasAirConditioners;
  final int hasBabySeat;
  final int rentCarIsClean;
  final int rentCarIsFullFuel;
  final Map<ParamKey, SearchParam> searchParams;
  const RentState({
    required this.list,
    required this.status,
    required this.paginationStatus,
    required this.next,
    required this.count,
    required this.categoryId,
    required this.hasAirConditioners,
    required this.hasBabySeat,
    required this.rentCarIsClean,
    required this.rentCarIsFullFuel,
    required this.searchParams,
  });

  RentState copyWith({
    List<RentMainEntity>? list,
    FormzStatus? status,
    FormzStatus? paginationStatus,
    String? next,
    int? count,
    int? categoryId,
    int? hasAirConditioners,
    int? hasBabySeat,
    int? rentCarIsClean,
    int? rentCarIsFullFuel,
    Map<ParamKey, SearchParam>? searchParams,
  }) =>
      RentState(
          list: list ?? this.list,
          status: status ?? this.status,
          paginationStatus: paginationStatus ?? this.paginationStatus,
          next: next ?? this.next,
          count: count ?? this.count,
          categoryId: categoryId ?? this.categoryId,
          hasAirConditioners: hasAirConditioners ?? this.hasAirConditioners,
          hasBabySeat: hasBabySeat ?? this.hasBabySeat,
          rentCarIsClean: rentCarIsClean ?? this.rentCarIsClean,
          rentCarIsFullFuel: rentCarIsFullFuel ?? this.rentCarIsFullFuel,
          searchParams: searchParams ?? this.searchParams);

  @override
  List<Object?> get props => [
        list,
        status,
        paginationStatus,
        next,
        count,
        categoryId,
        hasAirConditioners,
        hasBabySeat,
        rentCarIsClean,
        rentCarIsFullFuel,
        searchParams,
      ];
}
