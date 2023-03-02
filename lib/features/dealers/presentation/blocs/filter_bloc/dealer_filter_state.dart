part of 'dealer_filter_bloc.dart';

class DealerFilterState extends Equatable {
  final List<RegionEntity> region;
  final MakeEntity maker;
  final String? carType;

  const DealerFilterState({
    required this.carType,
    required this.region,
    required this.maker,
  });

  DealerFilterState copyWith({
    List<RegionEntity>? region,
    MakeEntity? maker,
    String? carType,
  }) =>
      DealerFilterState(
        region: region ?? this.region,
        maker: maker ?? this.maker,
        carType: carType ?? this.carType,
      );

  @override
  List<Object?> get props => [
        region,
        maker,
        carType,
      ];
}
