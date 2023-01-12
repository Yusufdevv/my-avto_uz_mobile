// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSearchDealerModel _$UserSearchDealerModelFromJson(
        Map<String, dynamic> json) =>
    UserSearchDealerModel(
      id: json['id'] as int? ?? 0,
      searchText: json['search_text'] as String? ?? '',
    );

Map<String, dynamic> _$UserSearchDealerModelToJson(
        UserSearchDealerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'search_text': instance.searchText,
    };
