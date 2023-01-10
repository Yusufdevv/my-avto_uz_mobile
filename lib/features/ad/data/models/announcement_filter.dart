import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_filter.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnnouncementFilterModel extends Equatable {
  final int? make;
  final int? model;
  final bool? isNew;
  final String prosta;
  final String region;

  const AnnouncementFilterModel({
    this.make,
    this.model,
    this.isNew,
    this.prosta = '',
    this.region = '',
  });

  AnnouncementFilterModel copyWith({
    int? make,
    int? model,
    bool? isNew,
    String? prosta,
    String? region,
  }) =>
      AnnouncementFilterModel(
        make: make ?? this.make,
        model: model ?? this.model,
        isNew: isNew ?? this.isNew,
        prosta: prosta ?? this.prosta,
        region: region?? this.region,
      );
  factory AnnouncementFilterModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementFilterModelToJson(this);
  @override
  List<Object?> get props => [
        make,
        model,
        isNew,
      ];
}
