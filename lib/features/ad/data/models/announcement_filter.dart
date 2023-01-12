import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_filter.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnnouncementFilterModel extends Equatable {
  final int? make;
  final int? model;
  final bool? isNew;
  final int? bodyType;
  final int? gearboxType;
  final int? driveType;

  const AnnouncementFilterModel({
    this.make,
    this.model,
    this.isNew,
    this.bodyType,
    this.gearboxType,
    this.driveType,
  });

  AnnouncementFilterModel copyWith({
    int? make,
    int? model,
    bool? isNew,
    int? bodyType,
    int? gearboxType,
    int? driveType,
  }) =>
      AnnouncementFilterModel(
        make: make ?? this.make,
        model: model ?? this.model,
        isNew: isNew ?? this.isNew,
        bodyType: bodyType ?? this.bodyType,
        gearboxType: gearboxType ?? this.gearboxType,
        driveType: driveType ?? this.driveType,
      );
  factory AnnouncementFilterModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementFilterModelToJson(this);
  @override
  List<Object?> get props => [
        make,
        model,
        isNew,
        bodyType,
        gearboxType,
        driveType,
      ];
}
