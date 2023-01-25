import 'package:auto/features/reels/domain/entities/reels_post_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reels_post_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReelsPostModel extends ReelsPostEntity {
  const ReelsPostModel({
    required super.reel,
    required super.status,
  });

  factory ReelsPostModel.fromJson(Map<String, dynamic> json) =>
      _$ReelsPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReelsPostModelToJson(this);
}
