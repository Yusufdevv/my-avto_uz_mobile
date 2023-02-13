import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'query_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QueryDataModel extends Equatable {
  const QueryDataModel({
    this.bodyType,
    this.driveType,
    this.gearboxType,
    this.engineType,
    this.isNew,
    this.priceFrom,
    this.priceTo,
    this.regionIn,
    this.yearFrom,
    this.yearTo,
  });

  @BodyTypeEntityConverter()
  final BodyTypeEntity? bodyType;
  @DriveTypeEntityConverter()
  final DriveTypeEntity? driveType;
  final int? engineType;
  @GearboxTypeEntityConverter()
  final GearboxTypeEntity? gearboxType;
  final String? regionIn;
  final bool? isNew;
  final int? priceFrom;
  final int? priceTo;
  final int? yearFrom;
  final int? yearTo;

  factory QueryDataModel.fromJson(Map<String, dynamic> json) =>
      _$QueryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$QueryDataModelToJson(this);

  @override
  List<Object?> get props => [
        bodyType,
        driveType,
        engineType,
        gearboxType,
        regionIn,
        isNew,
        priceFrom,
        priceTo,
        yearFrom,
        yearTo,
      ];
}
