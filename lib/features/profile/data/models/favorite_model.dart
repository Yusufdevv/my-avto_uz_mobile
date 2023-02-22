import 'package:auto/features/profile/domain/entities/favourite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  FavoriteModel(
      {required super.id,
      required super.gallery,
      required super.description,
      required super.price,
      required super.discount,
      required super.absoluteCarName,
      required super.isNew,
      required super.userType,
      required super.dealer,
      required super.user,
      required super.createdAt,
      required super.region,
      required super.isWishlisted});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        id: json['id'],
        gallery: json['gallery'] == null
            ? null
            : List<String>.from(json['gallery'].map((x) => x)),
        description: json['description'],
        price: json['price'],
        discount: json['discount'],
        absoluteCarName: json['absolute_car_name'],
        isNew: json['is_new'],
        userType: json['user_type'],
        dealer: json['dealer'] == null ? null : Dealer.fromJson(json['dealer']),
        user: json['user'] == null ? null : User.fromJson(json['user']),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        region: json['region'],
        isWishlisted: json['is_wishlisted'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'gallery':
            gallery == null ? null : List<dynamic>.from(gallery!.map((x) => x)),
        'description': description,
        'price': price,
        'discount': discount,
        'absolute_car_name': absoluteCarName,
        'is_new': isNew,
        'user_type': userType,
        // ignore: prefer_null_aware_operators
        'dealer': dealer == null ? null : dealer?.toJson(),
        // ignore: prefer_null_aware_operators
        'user': user == null ? null : user?.toJson(),
        // ignore: prefer_null_aware_operators
        'created_at': createdAt == null ? null : createdAt?.toIso8601String(),
        'region': region,
        'is_wishlisted': isWishlisted,
      };
}
