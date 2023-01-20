import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_reel_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LikeReelResponse {
  final int reel;
  final String status;

  const LikeReelResponse({
    required this.reel,
    required this.status,
  });

  factory LikeReelResponse.fromJson(Map<String, dynamic> json) =>
      _$LikeReelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LikeReelResponseToJson(this);
}
