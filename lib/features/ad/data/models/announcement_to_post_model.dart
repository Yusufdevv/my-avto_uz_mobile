import 'package:auto/features/ad/domain/entities/announcement/announcement_entity_to_post.dart';
import 'package:auto/features/ad/domain/entities/damaged_part/damaged_part.dart';
import 'package:json_annotation/json_annotation.dart';
part 'announcement_to_post_model.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class AnnouncementToPostModel extends AnnouncementToPostEntity {
  const AnnouncementToPostModel({
    required super.bodyType,
    required super.distanceTraveled,
    required super.driveType,
    required super.engineType,
    required super.gallery,
    required super.gearboxType,
    required super.generation,
    required super.id,
    required super.isRegisteredLocally,
    required super.licenceType,
    required super.make,
    required super.model,
    required super.modificationType,
    required super.ownership,
    required super.price,
    required super.purchaseDate,
    required super.region,
    required super.registeredInUzbekistan,
    required super.registrationCertificate,
    required super.registrationPlate,
    required super.registrationSerialNumber,
    required super.registrationVin,
    required super.year,
    required super.contactName,
    required super.contactPhone,
    required super.currency,
    required super.color,
    required super.contactAvailableFrom,
    required super.contactAvailableTo,
    required super.contactEmail,
    required super.description,
    required super.district,
    required super.isNew,
    required super.locationUrl,
    required super.damagedParts,
  });
  factory AnnouncementToPostModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementToPostModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnnouncementToPostModelToJson(this);
}
