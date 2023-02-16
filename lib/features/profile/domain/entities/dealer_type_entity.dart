class DealerFavEntity {
  DealerFavEntity({
    this.id,
    this.name,
    this.slug,
    this.avatar,
    this.description,
    this.phoneNumber,
    this.contactFrom,
    this.contactTo,
    this.longitude,
    this.latitude,
    this.carCount,
  });

  int? id;
  String? name;
  String? slug;
  String? avatar;
  String? description;
  String? phoneNumber;
  String? contactFrom;
  String? contactTo;
  double? longitude;
  double? latitude;
  int? carCount;

  factory DealerFavEntity.fromJson(Map<String, dynamic> json) =>
      DealerFavEntity(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
        avatar: json['avatar'],
        description: json['description'],
        phoneNumber: json['phone_number'],
        contactFrom: json['contact_from'],
        contactTo: json['contact_to'],
        longitude: json['longitude']?.toDouble(),
        latitude: json['latitude']?.toDouble(),
        carCount: json['car_count'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'avatar': avatar,
        'description': description,
        'phone_number': phoneNumber,
        'contact_from': contactFrom,
        'contact_to': contactTo,
        'longitude': longitude,
        'latitude': latitude,
        'car_count': carCount,
      };
}
