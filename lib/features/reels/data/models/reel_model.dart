import 'package:auto/features/reels/domain/entities/announcement_entity.dart';
import 'package:auto/features/reels/domain/entities/dealer_entity.dart';
import 'package:auto/features/reels/domain/entities/reel_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reel_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReelModel extends ReelEntity {
   ReelModel({
    required super.id,
    required super.title,
    required super.content,
    required super.likeCount,
    required super.shareCount,
    required super.dealer,
    required super.announcement,
    required super.isLiked,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) =>
      _$ReelModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReelModelToJson(this);
}
