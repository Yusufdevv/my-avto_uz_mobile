part of 'dealer_filter_bloc.dart';

class DealerFilterState extends Equatable {
  final List<Region> region;
  final MakeEntity? maker;
  final String? car_type;

  const DealerFilterState({
    required this.car_type,
    required this.region,
    this.maker,
  });

  DealerFilterState copyWith({
    List<Region>? region,
    MakeEntity? maker,
    String? car_type,
  }) =>
      DealerFilterState(
        region: region??this.region,
        maker: maker ?? this.maker,
        car_type: car_type?? this.car_type,
      );

  @override
  List<Object?> get props => [
    region,
    maker,
    car_type,
  ];
}
