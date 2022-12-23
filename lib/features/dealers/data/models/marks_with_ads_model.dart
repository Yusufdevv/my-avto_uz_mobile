import 'package:auto/features/dealers/domain/entities/marks_with_announcements.dart';
import 'package:json_annotation/json_annotation.dart';

part 'marks_with_ads_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MarksWithAdsModel extends MarksWithAnnouncementEntity {
  MarksWithAdsModel({
    required super.imageUrl,
    required super.mark,
    required super.quantity,
  });
  factory MarksWithAdsModel.fromJson(Map<String, dynamic> json) =>
      _$MarksWithAdsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarksWithAdsModelToJson(this);
}
