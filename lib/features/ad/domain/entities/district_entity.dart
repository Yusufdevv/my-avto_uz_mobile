import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';

class DistrictEntity extends Equatable {
  final int id;
  final String title;
  @RegionConverter()
  final RegionEntity region;
  const DistrictEntity({
    this.id = -1,
    this.region = const RegionEntity(),
    this.title = '',
  });

  @override
  List<Object?> get props => [];
}
