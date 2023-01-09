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
  QueryData? queryData;
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

class QueryData {
  QueryData({
    this.make,
    this.model,
  });

  int? make;
  List<int?>? model;

  factory QueryData.fromJson(Map<String, dynamic> json) => QueryData(
        make: json['make'],
        model: json['model'] == null
            ? []
            : List<int?>.from(json['model']!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'make': make,
        'model': model == null ? [] : List<dynamic>.from(model!.map((x) => x)),
      };
}
