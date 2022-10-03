import 'package:auto/features/profile/domain/entities/user_count.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_count.g.dart';

@JsonSerializable()
class UserCountModel extends UserCountEntity {
  const UserCountModel({
    required super.id,
    required super.user,
    required super.announcementCount,
    required super.comparesCount,
    required super.reviewsCount,
    required super.searchCount,
    required super.wishListCount,
  });

  factory UserCountModel.fromJson(Map<String, dynamic> json) => _$UserCountModelFromJson(json);
}
