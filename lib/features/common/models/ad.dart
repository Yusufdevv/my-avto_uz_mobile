import 'package:auto/features/common/domain/model/user.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ad.g.dart';

@JsonSerializable()
class AdModel extends AdsEntity {
  final int id;
  final String mark;
  final String model;
  final String generation;
  final List<String> images;
  final String region;
  final String description;
  final int year;
  @JsonKey(name: 'view_count')
  final int viewCount;
  final double longitude;
  final double latitude;
  final String user;
  @JsonKey(name: 'is_wishlisted')
  final bool isFav;

  AdModel({
    this.id = 0,
    this.viewCount = 0,
    this.longitude = 0,
    this.latitude = 0,
    this.year = 0,
    this.mark = '',
    this.model = '',
    this.generation = '',
    this.region = '',
    this.description = '',
    this.images = const [],
    this.user = '',
    this.isFav = false
  }):super(aboutCar: description,carName: model,price: 232,imageUrl: images.isNotEmpty?images.first:'',place: '');

  factory AdModel.fromJson(Map<String,dynamic> json) =>_$AdModelFromJson(json);
}