import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  @JsonKey(name: 'access', defaultValue: '')
  final String access;
  @JsonKey(name: 'access_token', defaultValue: '')
  final String accessToken;
  @JsonKey(name: 'refresh', defaultValue: '')
  final String refresh;
  @JsonKey(name: 'refresh_token', defaultValue: '')
  final String refreshToken;

  TokenModel(
      {required this.access,
      required this.refresh,
      required this.accessToken,
      required this.refreshToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
