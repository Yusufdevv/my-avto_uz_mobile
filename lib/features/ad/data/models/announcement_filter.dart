import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_filter.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnnouncementFilterModel extends Equatable {
  final int make;
  final int model;
  final bool? isNew;
  final String prosta;

  const AnnouncementFilterModel({
    this.make = 0,
    this.model = 0,
    this.isNew,
    this.prosta = '',
  });

  AnnouncementFilterModel copyWith({
    int? make,
    int? model,
    bool? isNew,
    String? prosta,
  }) =>
      AnnouncementFilterModel(
        make: make ?? this.make,
        model: model ?? this.model,
        isNew: isNew ?? this.isNew,
        prosta: prosta?? this.prosta,
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
