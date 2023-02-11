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

  final int? bodyType;
  final int? driveType;
  final int? engineType;
  final int? gearboxType;
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
