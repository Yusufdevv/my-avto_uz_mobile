class UserSingleEntity {
   const UserSingleEntity({
        this.user,
        this.announcement,
    });

   final User? user;
   final Announcement? announcement;

    factory UserSingleEntity.fromJson(Map<String, dynamic> json) => UserSingleEntity(
        user: json['user'] == null ? const User() : User.fromJson(json['user']),
        announcement: json['announcement'] == null ? const Announcement() : Announcement.fromJson(json['announcement']),
    );

}

class Announcement {
   const Announcement({
        this.contactName,
        this.contactPhone,
        this.contactEmail,
        this.contactAvailableFrom,
        this.contactAvailableTo,
        this.locationUrl,
        this.longitude,
        this.latitude,
        this.userType,
        this.description,
        this.gallery,
    });

  final String? contactName;
  final String? contactPhone;
  final String? contactEmail;
  final String? contactAvailableFrom;
  final String? contactAvailableTo;
  final String? locationUrl;
  final double? longitude;
  final double? latitude;
  final String? userType;
  final String? description;
  final List<String>? gallery;

    factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        contactName: json['contact_name']  as String? ?? '',
        contactPhone: json['contact_phone']  as String? ?? '',
        contactEmail: json['contact_email']  as String? ?? '',
        contactAvailableFrom: json['contact_available_from']  as String? ?? '',
        contactAvailableTo: json['contact_available_to']  as String? ?? '',
        locationUrl: json['location_url']  as String? ?? '',
        longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
        latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
        userType: json['user_type']   as String? ?? '',
        description: json['description']   as String? ?? '',
        gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );
}

class User {
   const User({
        this.image,
    });
   final String? image;

    factory User.fromJson(Map<String, dynamic> json) => User(
        image: json['image'] as String? ?? '',
    );
}
