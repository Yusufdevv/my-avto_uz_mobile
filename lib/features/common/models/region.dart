import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'region.g.dart';

@JsonSerializable()
class Region extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'name')
  final String name;
  const Region({this.id = 0, this.title = '', this.name = ''});

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  @override
  List<Object?> get props => [id, title, name];
}
