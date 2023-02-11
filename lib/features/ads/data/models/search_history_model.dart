import 'package:auto/features/ads/data/models/query_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_history_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SaveFilterModel extends Equatable {
  const SaveFilterModel({
    this.make,
    this.model,
    this.query,
    this.queryData,
  });

  final int? make;
  final List<int?>? model;
  final String? query;
  final QueryDataModel? queryData;

  SaveFilterModel copyWith({
    int? make,
    List<int?>? model,
    String? query,
    QueryDataModel? queryData,
  }) =>
      SaveFilterModel(
        make: make ?? this.make,
        model: model ?? this.model,
        query: query ?? this.query,
        queryData: queryData ?? this.queryData,
      );

  factory SaveFilterModel.fromJson(Map<String, dynamic> json) =>
      _$SaveFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveFilterModelToJson(this);

  @override
  List<Object?> get props => [make, model, query, queryData];
}
