import 'package:auto/features/common/models/image.dart';
import 'package:json_annotation/json_annotation.dart';
part 'car_make.g.dart';

@JsonSerializable()
class CarMake {
  @JsonKey(name: 'id',defaultValue: 0)
  final int id ;
  @JsonKey(name: 'name',defaultValue: '')
  final String name ;
  @JsonKey(name: 'slug',defaultValue: '')
  final String slug;
  @JsonKey(name: 'logo',)
  final ImageModel logo;
  CarMake({required this.name,required this.id,required this.logo,required this.slug});

  factory CarMake.fromJson(Map<String,dynamic> json)=>_$CarMakeFromJson(json);
}