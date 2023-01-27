part of 'dealer_filter_bloc.dart';

class DealerFilterState extends Equatable {
  final List<Region> region;
  final MakeEntity? maker;
  final String? carType;

  const DealerFilterState({
    required this.carType,
    required this.region,
    this.maker,
  });

  DealerFilterState copyWith({
    List<Region>? region,
    MakeEntity? maker,
    String? carType,
  }) =>
      DealerFilterState(
        region: region??this.region,
        maker: maker ?? this.maker,
        carType: carType?? this.carType,
      );

  @override
  List<Object?> get props => [
    region,
    maker,
    carType,
  ];
}
