import 'package:auto/features/common/domain/model/stats_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class StatsEntity extends Equatable {
  const StatsEntity({this.viewsCount = 0,this.wishlistCount = 0, this.viewedContactsCount = 0});

  final int viewsCount;
  final int wishlistCount;
  final int viewedContactsCount;

  @override
  List<Object?> get props => [viewsCount, wishlistCount, viewedContactsCount];
}

class StatsConverter
    implements JsonConverter<StatsEntity, Map<String, dynamic>?> {
  const StatsConverter();

  @override
  StatsEntity fromJson(Map<String, dynamic>? json) =>
      StatsModel.fromJson(json ?? {});
  @override
  Map<String, dynamic>? toJson(StatsEntity object) =>
      StatsModel(viewsCount: object.viewsCount, wishlistCount: object.wishlistCount, viewedContactsCount: object.viewedContactsCount, ).toJson();
}
