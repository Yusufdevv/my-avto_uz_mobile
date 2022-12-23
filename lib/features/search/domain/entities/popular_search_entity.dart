import 'package:auto/features/search/data/models/popular_search_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PopularSearchEntity extends Equatable {
  const PopularSearchEntity({this.searchText = ''});

  final String searchText;

  @override
  List<Object?> get props => [searchText];
}

class PopularSearchesResultConverter
    implements JsonConverter<PopularSearchEntity, Map<String, dynamic>?> {
  const PopularSearchesResultConverter();

  @override
  PopularSearchEntity fromJson(Map<String, dynamic>? json) =>
      PopularSearchModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(PopularSearchEntity object) => {};
}
