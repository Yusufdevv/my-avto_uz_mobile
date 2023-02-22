import 'package:auto/features/dealers/domain/entities/make_entity.dart';
import 'package:auto/features/dealers/domain/entities/marks_in_dealer_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'marks_with_ads_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MarksWithAdsModel extends MarksInDealerEntity {
  const MarksWithAdsModel({
    required super.carsCount,
    required super.make,
  });
  factory MarksWithAdsModel.fromJson(Map<String, dynamic> json) =>
      _$MarksWithAdsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarksWithAdsModelToJson(this);
}
