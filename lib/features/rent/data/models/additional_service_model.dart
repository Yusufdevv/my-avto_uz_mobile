import 'package:auto/features/rent/domain/entities/additional_services_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'additional_service_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AdditionalServiceModel extends AdditionalServiceEntity {
  const AdditionalServiceModel({
    required super.id,
    required super.name,
    required super.price,
  });
  factory AdditionalServiceModel.fromJson(Map<String, dynamic> json) =>
      _$AdditionalServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalServiceModelToJson(this);
}
