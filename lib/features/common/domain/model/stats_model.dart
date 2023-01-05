import 'package:auto/features/common/domain/entity/stats_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'stats_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StatsModel extends StatsEntity {
  const StatsModel({required super.viewsCount, required super.viewedContactsCount, required super.wishlistCount});
  factory StatsModel.fromJson(Map<String, dynamic> json) =>
      _$StatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatsModelToJson(this);
}
