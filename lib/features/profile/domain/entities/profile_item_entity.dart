import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ProfileItemEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'avatar_url', defaultValue: '')
  final String avatarUrl;
  @JsonKey(name: 'count', defaultValue: 0)
  final int count;

  const ProfileItemEntity(
      {required this.id,
      required this.name,
      required this.avatarUrl,
      required this.count});

  @override
  List<Object> get props => [id, name, avatarUrl, count];

  ProfileItemEntity copyWith({
    int? id,
    String? name,
    String? avatarUrl,
    int? count,
  }) =>
      ProfileItemEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        count: count ?? this.count,
      );
}
