import 'package:auto/features/ad/domain/entities/equipment/id_name_entity.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ads/data/models/query_data_model.dart';

class MySearchesEntity {
  MySearchesEntity({
    this.id,
    this.user,
    this.make,
    this.model,
    this.query,
    this.queryData,
  });

  int? id;
  int? user;
  @MakeEntityConverter()
  MakeEntity? make;
  @IdNameConverter()
  List<IdNameEntity?>? model;
  String? query;
  QueryDataModel? queryData;
}
