import 'package:auto/features/ad/data/models/equipment/equipment_category_model.dart';
import 'package:auto/features/ads/data/models/query_data_model.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/reviews/data/models/make_model.dart';

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
          make: json['make'] == null ? null : MakeModel.fromJson(json['make']),
          model: json['model'] == null
              ? []
              // ignore: unnecessary_lambdas
              : List<IdNameModel?>.from(json['model']!.map((x) => IdNameModel.fromJson(x))),
          query: json['query'],
          queryData: json['query_data'] == null
              ? null
              : QueryDataModel.fromJson(json['query_data']));
}
