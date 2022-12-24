import 'package:auto/features/dealers/domain/entities/single_mark_announcements.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_mark_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SingleMarkModel extends SingleMarkWithAnnouncemetsEntity {
  SingleMarkModel({
    required super.amount,
    required super.description,
    required super.mark,
    required super.year,
  });
  factory SingleMarkModel.fromJson(Map<String, dynamic> json) =>
      _$SingleMarkModelFromJson(json);

  Map<String, dynamic> toJson() => _$SingleMarkModelToJson(this);
}
