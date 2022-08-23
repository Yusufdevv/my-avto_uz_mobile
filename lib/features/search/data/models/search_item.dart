import 'package:auto/features/common/models/naming.dart';
import 'package:auto/features/search/data/models/car_make.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_item.g.dart';

@JsonSerializable()
class SearchItemModel {
  @JsonKey(name: 'id', defaultValue: '')
  final int id;
  @JsonKey(name: 'car_year', defaultValue: '')
  final int carYear;
  @JsonKey(name: 'licence_type', defaultValue: '')
  final String licenseType;
  @JsonKey(name: 'ownership', defaultValue: '')
  final String ownerShip;
  @JsonKey(name: 'description ', defaultValue: '')
  final String description;
  @JsonKey(name: 'contact_name', defaultValue: '')
  final String contactName;
  @JsonKey(name: 'contact_email', defaultValue: '')
  final String contactEmail;
  @JsonKey(name: 'contact_phone', defaultValue: '')
  final String contactPhone;
  @JsonKey(name: 'is_registered_locally', defaultValue: '')
  final bool isRegisteredLocally;
  @JsonKey(name: 'user_type', defaultValue: '')
  final bool userType;
  @JsonKey(name: 'is_new', defaultValue: '')
  final bool isNew;
  @JsonKey(name: 'price', defaultValue: '')
  final int price;
  @JsonKey(name: 'currency', defaultValue: '')
  final int currency;
  @JsonKey(name: 'published_at', defaultValue: '')
  final int publishedAt;
  @JsonKey(
    name: 'car_make',
  )
  final CarMake carMake;
  @JsonKey(name: 'car_model',)
  final NamingModel carModel;

  SearchItemModel(
      {required this.id,
      required this.carModel,
      required this.carMake,
      required this.currency,
      required this.price,
      required this.description,
      required this.carYear,
      required this.contactEmail,
      required this.contactName,
      required this.contactPhone,
      required this.isNew,
      required this.isRegisteredLocally,
      required this.licenseType,
      required this.ownerShip,
      required this.publishedAt,
      required this.userType});

  factory SearchItemModel.fromJson(Map<String, dynamic> json) =>
      _$SearchItemModelFromJson(json);
}
