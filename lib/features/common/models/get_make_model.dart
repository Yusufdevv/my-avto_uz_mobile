import 'package:auto/features/common/entities/makes_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
part 'get_make_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetMakeModel extends GetMakeEntity {
  const GetMakeModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });
  factory GetMakeModel.fromJson(Map<String, dynamic> json) =>
      _$GetMakeModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMakeModelToJson(this);
}
