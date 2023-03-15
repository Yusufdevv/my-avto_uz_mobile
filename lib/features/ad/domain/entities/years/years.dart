import 'package:auto/features/ad/data/models/years.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class YearsEntity extends Equatable {
  final int id;
  final List<int> years;
  final int model;

  const YearsEntity({
    this.id = -1,
    this.years = const <int>[],
    this.model = -1,
  });

  @override
  List<Object?> get props => [
        id,
        years,
        model,
      ];
}

class YearsEntityConverter
    extends JsonConverter<YearsEntity, Map<String, dynamic>?> {
  const YearsEntityConverter();

  @override
  YearsEntity fromJson(Map<String, dynamic>? json) =>
      YearsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(YearsEntity object) => {};
}
