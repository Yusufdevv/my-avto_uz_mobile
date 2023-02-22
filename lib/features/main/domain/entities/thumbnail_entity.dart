import 'package:auto/features/main/data/models/thumbnail_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CoverImageThumbnailEntity extends Equatable {
  final String crop;
  final String square;

  const CoverImageThumbnailEntity({
    this.crop = '',
    this.square = '',
  });

  @override
  List<Object?> get props => [];
}

class CoverImageThumbnailConverter
    implements JsonConverter<CoverImageThumbnailEntity, Map<String, dynamic>?> {
  const CoverImageThumbnailConverter();

  @override
  CoverImageThumbnailEntity fromJson(Map<String, dynamic>? json) =>
      CoverImageThumbnailModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(CoverImageThumbnailEntity object) => {};
}
