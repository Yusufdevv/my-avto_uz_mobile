import 'package:auto/features/profile/data/models/user_count.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class UsercountdataEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'user', defaultValue: 0)
  final int user;
  @JsonKey(name: 'announcement_wishlist_count', defaultValue: 0)
  final int wishListCount;
  @JsonKey(name: 'compares_count', defaultValue: 0)
  final int comparesCount;
  @JsonKey(name: 'announcement_count', defaultValue: 0)
  final int announcementCount;
  @JsonKey(name: 'search_count', defaultValue: 0)
  final int searchCount;
  @JsonKey(name: 'reviews_count', defaultValue: 0)
  final int reviewsCount;

  const UsercountdataEntity({
    required this.id,
    required this.user,
    required this.announcementCount,
    required this.comparesCount,
    required this.reviewsCount,
    required this.searchCount,
    required this.wishListCount,
  });

  @override
  List<Object?> get props => [
        id,
        user,
        announcementCount,
        comparesCount,
        reviewsCount,
        searchCount,
        wishListCount,
      ];
}

class UsercountdataEntityConverter
    extends JsonConverter<UsercountdataEntity, Map<String, dynamic>?> {
  const UsercountdataEntityConverter();

  @override
  UsercountdataEntity fromJson(Map<String, dynamic>? json) =>
      UsercountdataModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(UsercountdataEntity object) => {};
}
