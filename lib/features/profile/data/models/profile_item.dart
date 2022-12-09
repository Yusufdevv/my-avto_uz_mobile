import 'package:auto/features/profile/domain/entities/profile_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_item.g.dart';

@JsonSerializable(createToJson: false)
class ProfileItemModel extends ProfileItemEntity {
  factory ProfileItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileItemModelFromJson(json);

  const ProfileItemModel({
    required int id,
    required String name,
    required String avatarUrl,
    required int count,
  }) : super(id: id, count: count, avatarUrl: avatarUrl, name: name);

  factory ProfileItemModel.empty() =>
      const ProfileItemModel(id: 0, name: '', avatarUrl: '', count: 0);

  @override
  String toString() =>
      'ProfileItemModel(id: $id,name: $name,avatarUrl: $avatarUrl,count: $count)';
}
