import 'package:json_annotation/json_annotation.dart';
part 'car_brand.g.dart';

@JsonSerializable()
class CarBrand {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'slug', defaultValue: '')
  final String slug;
  @JsonKey(name: 'logo', defaultValue: '')
  final String logo;
  CarBrand(
      {required this.name,
      required this.id,
      required this.logo,
      required this.slug});
  factory CarBrand.fromJson(Map<String, dynamic> json) =>
      _$CarBrandFromJson(json);
}
