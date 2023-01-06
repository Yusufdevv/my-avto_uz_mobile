import 'package:freezed_annotation/freezed_annotation.dart';

class OtherAdsEntity {
  @JsonKey(defaultValue: '')
  final String imageUrl;
  @JsonKey(defaultValue: '')
  final String model;
  @JsonKey(defaultValue: '')
  final String price;
  @JsonKey(defaultValue: '')
  final String location;
  @JsonKey(defaultValue: '')
  final String characteristic;

  const OtherAdsEntity({
    this.price = '',
    this.characteristic = '',
    this.imageUrl = '',
    this.location = '',
    this.model = '',
  });
}
