import 'package:auto/features/profile/domain/entities/directory_entity.dart';

class DirectoryModel extends DirectoryEntity {
  DirectoryModel({
    super.id,
    super.name,
    super.slug,
    super.category,
    super.address,
    super.region,
    super.latitude,
    super.longitude,
    super.contactFrom,
    super.contactTo,
    super.avatar,
  });

  factory DirectoryModel.fromJson(Map<String, dynamic> json) => DirectoryModel(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
        category: Category.fromJson(json['category']),
        address: json['address'],
        region: json['region'],
        latitude: json['latitude'].toDouble(),
        longitude: json['longitude'].toDouble(),
        contactFrom: json['contact_from'],
        contactTo: json['contact_to'],
        avatar: json['avatar'],
      );
}
