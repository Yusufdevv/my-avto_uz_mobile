class DirectoryEntity {
  DirectoryEntity({
   required this.category,
    required this.workingDays,
    this.id,
    this.name,
    this.slug,
    this.address,
    this.region,
    this.latitude,
    this.longitude,
    this.contactFrom,
    this.contactTo,
    this.avatar,
    this.isWorkingAllDays=false,
  });

  int? id;
  String? name;
  String? slug;
  List<Category> category;
  String? address;
  String? region;
  num? latitude;
  num? longitude;
  String? contactFrom;
  String? contactTo;
  String? avatar;
  final bool isWorkingAllDays;
   final List<WorkingDay> workingDays;

}

class Category {
  Category({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class WorkingDaysEntity {
  WorkingDaysEntity({
    required this.workingDays,
  });

  final List<WorkingDay> workingDays;

  factory WorkingDaysEntity.fromJson(Map<String, dynamic> json) => WorkingDaysEntity(
    workingDays: List<WorkingDay>.from(json['working_days'].map(WorkingDay.fromJson)),
  );

}

class WorkingDay {
  WorkingDay({
    required this.dayOfWeek,
  });

  final String dayOfWeek;

  factory WorkingDay.fromJson(Map<String, dynamic> json) => WorkingDay(
    dayOfWeek: json['day_of_week'],
  );

}