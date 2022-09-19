import 'package:auto/features/common/domain/entity/car_brand_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_brand.g.dart';

@JsonSerializable()
class TopBrandModel extends CarBrandEntity {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'logo', defaultValue: '')
  final String logo;

  TopBrandModel({this.id = 0, this.name = '', this.logo = ''})
      : super(title: name, id: id, icon: logo);

  factory TopBrandModel.fromJson(Map<String, dynamic> json) =>
      _$TopBrandModelFromJson(json);
}
