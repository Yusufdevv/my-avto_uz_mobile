part of 'dealer_filter_bloc.dart';

class DealerFilterState extends Equatable {
  final List<Region> regions;
  final MakeEntity? maker;
  final bool car_type;

  const DealerFilterState({
    required this.car_type,
    required this.regions,
    this.maker,
  });

  DealerFilterState copyWith({
    List<Region>? regions,
    MakeEntity? maker,
    bool? car_type,
  }) =>
      DealerFilterState(
        regions: regions ?? this.regions,
        maker: maker ?? this.maker,
        car_type: car_type?? this.car_type,
      );

  @override
  List<Object?> get props => [
    regions,
    maker,
    car_type,
  ];
}
