import 'package:auto/features/dealers/data/models/marks_with_ads_model.dart';
import 'package:auto/features/dealers/domain/entities/make_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class MarksInDealerEntity extends Equatable {
  @DealerMakeConverter()
  final DealerMakeEntity make;
  final int carsCount;

  const MarksInDealerEntity({
    this.make = const DealerMakeEntity(),
    this.carsCount = 0,
  });

  @override
  List<Object?> get props => [
        make,
        carsCount,
      ];
}

class DealerCardConvert
    implements JsonConverter<MarksInDealerEntity, Map<String, dynamic>?> {
  const DealerCardConvert();

  @override
  MarksInDealerEntity fromJson(Map<String, dynamic>? json) =>
      MarksWithAdsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(MarksInDealerEntity object) => {};
}
