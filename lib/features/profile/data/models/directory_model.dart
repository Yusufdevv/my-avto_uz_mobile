import 'package:auto/features/profile/domain/entities/directory_entity.dart';

class DirectoryModel extends DirectoryEntity {
  DirectoryModel({
   required super.category,
    required super.workingDays,
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
    super.isWorkingAllDays,
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
        isWorkingAllDays: json['is_working_all_days'],
        workingDays: (json['working_days'] as List).isEmpty ? [] : List<WorkingDay>.from(json['working_days'].map((x) => WorkingDay.fromJson(x))) ,
      );
}
