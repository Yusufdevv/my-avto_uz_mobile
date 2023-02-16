import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/domain/entity/car_district_entity.dart';
import 'package:auto/features/common/domain/entity/car_generation_entity.dart';
import 'package:auto/features/common/domain/entity/car_make_entity.dart';
import 'package:auto/features/common/domain/entity/car_model_entity.dart';
import 'package:auto/features/common/domain/entity/car_user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_item_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchItemModel extends AutoEntity {
  SearchItemModel({
    required super.year,
    required super.description,
    required super.gallery,
    required super.publishedAt,
    required super.isNew,
    required super.price,
    required super.isWishlisted,
    required super.currency,
    required super.userType,
    required super.contactPhone,
    required super.district,
    required super.user,
    required super.model,
    required super.dealer,
    required super.generation,
    required super.make,
  });

  factory SearchItemModel.fromJson(Map<String, dynamic> json) =>
      _$SearchItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchItemModelToJson(this);
}
