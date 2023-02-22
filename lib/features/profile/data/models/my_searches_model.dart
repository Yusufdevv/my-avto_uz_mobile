import 'package:auto/features/ads/data/models/query_data_model.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';

class MySearchesModel extends MySearchesEntity {
  MySearchesModel({
    required super.id,
    required super.user,
    required super.make,
    required super.model,
    required super.query,
    required super.queryData,
  });

  factory MySearchesModel.fromJson(Map<String, dynamic> json) =>
      MySearchesModel(
          id: json['id'],
          user: json['user'],
          make: json['make'] == null ? null : Make.fromJson(json['make']),
          model: json['model'] == null
              ? []
              // ignore: unnecessary_lambdas
              : List<Model?>.from(json['model']!.map((x) => Model.fromJson(x))),
          query: json['query'],
          queryData: json['query_data'] == null
              ? null
              : QueryDataModel.fromJson(json['query_data']));
}
