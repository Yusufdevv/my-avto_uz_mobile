import 'package:auto/features/dealers/domain/entities/dealer_card_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dealer_card_model.g.dart';

@JsonSerializable()
class DealerCardModel extends DealerCardEntity {
  const DealerCardModel(
      {required int id,
      required String name,
      required String slug,
      required String description,
      required String phone,
      required String contactFrom,
      required String contactTo,
      required double longitude,
      required double latitude,
      required String type,
      required int carCount,
      required String avatar,
      required int district})
      : super(
            id: id,
            name: name,
            slug: slug,
            description: description,
            phone: phone,
            contactTo: contactTo,
            contactFrom: contactFrom,
            longitude: longitude,
            latitude: latitude,
            type: type,
            carCount: carCount,
            avatar: avatar,
            district: district);

  factory DealerCardModel.empty() => const DealerCardModel(
        id: 0,
        name: '',
        slug: '',
        description: '',
        phone: '',
        contactFrom: '',
        contactTo: '',
        longitude: 0,
        latitude: 0,
        type: '',
        carCount: 0,
        avatar: '',
        district: 0,
      );

  @override
  String toString() => 'DealerCardModel(id: $id, name: $name, slug: $slug, description: $description, contactFrom: $contactFrom,contactTo: $contactTo, longitude: $longitude,latitude: $latitude, type: $type, carCount: $carCount,avatar: $avatar,district: $district,)';

  factory DealerCardModel.fromJson(Map<String, dynamic> json) =>
      _$DealerCardModelFromJson(json);
}
