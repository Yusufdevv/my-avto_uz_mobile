class DirectoryEntity {
  DirectoryEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.address,
    this.region,
    this.latitude,
    this.longitude,
    this.contactFrom,
    this.contactTo,
    this.avatar,
  });

  int? id;
  String? name;
  String? slug;
  Category? category;
  String? address;
  String? region;
  num? latitude;
  num? longitude;
  String? contactFrom;
  String? contactTo;
  String? avatar;
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
