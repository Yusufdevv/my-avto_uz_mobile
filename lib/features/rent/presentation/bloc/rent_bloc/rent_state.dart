part of 'rent_bloc.dart';

class RentState extends Equatable {
  final PaginatorStatus status;
  final String? next;
  final List<RentEntity> rents;
  final bool fetchMore;

  const RentState({
    this.status = PaginatorStatus.PAGINATOR_INITIAL,
    this.next,
    this.rents = const [],
    this.fetchMore = false,
  });

  RentState copyWith({
    PaginatorStatus? status,
    String? next,
    List<RentEntity>? rents,
    bool? fetchMore,
  }) =>
      RentState(
        next: next,
        status: status ?? this.status,
        rents: rents ?? this.rents,
        fetchMore: fetchMore ?? this.fetchMore,
      );

  @override
  List<Object?> get props => [
        status,
        next,
        rents,
        fetchMore,
      ];
}
