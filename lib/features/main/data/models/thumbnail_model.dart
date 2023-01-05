import 'package:auto/features/main/domain/entities/thumbnail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thumbnail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CoverImageThumbnailModel extends CoverImageThumbnailEntity {
  const CoverImageThumbnailModel({
    required super.crop,
    required super.square,
  });

  factory CoverImageThumbnailModel.fromJson(Map<String, dynamic> json) =>
      _$CoverImageThumbnailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoverImageThumbnailModelToJson(this);
}
