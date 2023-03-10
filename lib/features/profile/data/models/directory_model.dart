import 'package:auto/features/profile/domain/entities/directory_entity.dart';

class DirectoryModel extends DirectoryEntity {
  DirectoryModel({
   required super.category,
    super.id,
    super.name,
    super.slug,
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
        category: (json['category'] as List).isEmpty ? [] : List<Category>.from(json['category'].map((x) => Category.fromJson(x))),
        address: json['address'],
        region: json['region'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        contactFrom: json['contact_from'],
        contactTo: json['contact_to'],
        avatar: json['avatar'],
      );
}
