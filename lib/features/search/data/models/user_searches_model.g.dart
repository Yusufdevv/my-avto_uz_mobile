// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_searches_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSearchesModel _$UserSearchesModelFromJson(Map<String, dynamic> json) =>
    UserSearchesModel(
      id: json['id'] as int? ?? 0,
      searchText: json['search_text'] as String? ?? '',
    );

Map<String, dynamic> _$UserSearchesModelToJson(UserSearchesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'search_text': instance.searchText,
    };
