import 'package:auto/features/search/data/models/popular_searches_result_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PopularSearchesResultEntity extends Equatable {
  const PopularSearchesResultEntity({
    this.id = 0,
    this.searchText = '',
  });

  final int id;
  final String searchText;

  @override
  List<Object?> get props => [id, searchText];
}

class PopularSearchesResultConverter
    implements
        JsonConverter<PopularSearchesResultEntity, Map<String, dynamic>?> {
  const PopularSearchesResultConverter();

  @override
  PopularSearchesResultEntity fromJson(Map<String, dynamic>? json) =>
      PopularSearchesResultModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(PopularSearchesResultEntity object) => {};
}
