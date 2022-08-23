import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class DealerCardEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'slug', defaultValue: '')
  final String slug;
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @JsonKey(name: 'phone', defaultValue: '')
  final String phone;
  @JsonKey(name: 'contact_from', defaultValue: '')
  final String contactFrom;
  @JsonKey(name: 'contact_to', defaultValue: '')
  final String contactTo;
  @JsonKey(name: 'longitude', defaultValue: 0)
  final double longitude;
  @JsonKey(name: 'latitude', defaultValue: 0)
  final double latitude;
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @JsonKey(name: 'carCount', defaultValue: 0)
  final int carCount;
  @JsonKey(name: 'avatar', defaultValue: 0)
  final String avatar;
  @JsonKey(name: 'district', defaultValue: 0)
  final int district;

  const DealerCardEntity(
      {required this.id,
      required this.name,
      required this.slug,
      required this.description,
      required this.phone,
      required this.contactFrom,
      required this.contactTo,
      required this.longitude,
      required this.latitude,
      required this.type,
      required this.carCount,
      required this.avatar,
      required this.district});

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        description,
        phone,
        contactFrom,
        contactTo,
        longitude,
        latitude,
        type,
        carCount,
        avatar,
        district
      ];

  DealerCardEntity copyWith(
          {int? id,
          String? name,
          String? slug,
          String? description,
          String? avatarUrl,
          String? phone,
          String? contactTo,
          String? contactFrom,
          double? latitude,
          double? longitude,
          String? type,
          String? avatar,
          int? district,
          int? carCount}) =>
      DealerCardEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        type: type ?? this.type,
        slug: slug ?? this.slug,
        phone: phone ?? this.phone,
        contactFrom: contactFrom ?? this.contactFrom,
        contactTo: contactTo ?? this.contactTo,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        carCount: carCount ?? this.carCount,
        avatar: avatar ?? this.avatar,
        district: district ?? this.district,
      );
}
