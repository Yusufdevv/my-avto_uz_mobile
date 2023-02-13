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
  Make? make;
  List<Model?>? model;
  String? query;
  QueryDataModel? queryData;
}

class Make {
  Make({
    this.id,
    this.name,
    this.slug,
    this.logo,
  });

  int? id;
  String? name;
  String? slug;
  dynamic logo;

  factory Make.fromJson(Map<String, dynamic> json) => Make(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
        logo: json['logo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'logo': logo,
      };
}

class Model {
  Model({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}


// class QueryData {
//     QueryData({
//         this.isNew,
//         this.yearTo,
//         this.priceTo,
//         this.bodyType,
//         this.regionIn,
//         this.yearFrom,
//         this.driveType,
//         this.priceFrom,
//         this.engineType,
//         this.gearboxType,
//     });

//   final BodyTypeEntity? bodyType;
//   final DriveTypeEntity? driveType;
//   final int? engineType;
//   final GearboxTypeEntity? gearboxType;
//   final String? regionIn;
//   final bool? isNew;
//   final int? priceFrom;
//   final int? priceTo;
//   final int? yearFrom;
//   final int? yearTo;

//     factory QueryData.fromJson(Map<String, dynamic> json) => QueryData(
//         isNew: json['is_new'] as bool? ?? false,
//         yearTo: json['year_to'] as int? ?? -1,
//         priceTo: json['year_to'] as int? ?? -1,
//         bodyType: json['body_type']  as int? ?? -1,
//         regionIn: json['region_in'] as String? ?? '',
//         yearFrom: json['year_from']   as int? ?? -1,
//         driveType: json['drive_type'] as int? ?? -1,
//         priceFrom: (json['price_from']  as num?)?.toDouble() ?? -1,
//         engineType: json['engine_type'] as int? ?? -1,
//         gearboxType: json['gearbox_type'] as int? ?? -1,
//     );

//     Map<String, dynamic> toJson() => {
//         'is_new': isNew,
//         'year_to': yearTo,
//         'price_to': priceTo,
//         'body_type': bodyType,
//         'region_in': regionIn,
//         'year_from': yearFrom,
//         'drive_type': driveType,
//         'price_from': priceFrom,
//         'engine_type': engineType,
//         'gearbox_type': gearboxType,
//     };
// }
