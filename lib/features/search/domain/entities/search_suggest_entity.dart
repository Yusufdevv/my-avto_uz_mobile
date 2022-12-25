import 'package:auto/features/common/domain/entity/car_make_entity.dart';
import 'package:auto/features/search/data/models/car_suggestion_model.dart';
import 'package:auto/features/search/data/models/options_model.dart';
import 'package:auto/features/search/data/models/source_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class SearchSuggestEntity {
  const SearchSuggestEntity({
    this.absoluteCarNameSuggestCompletion = const [],
  });
  @JsonKey(name: 'absolute_car_name_suggest__completion')
  @CarSuggestionConverter()
  final List<CarSuggestionEntity> absoluteCarNameSuggestCompletion;
}

class CarSuggestionEntity extends Equatable {
  const CarSuggestionEntity({
    this.text = '',
    this.options = const [],
  });

  final String text;
  @JsonKey(name: 'options')
  @OptionsConverter()
  final List<OptionsEntity> options;
  @override
  List<Object?> get props => [text, options];
}

class CarSuggestionConverter
    implements JsonConverter<CarSuggestionEntity, Map<String, dynamic>?> {
  const CarSuggestionConverter();

  @override
  CarSuggestionEntity fromJson(Map<String, dynamic>? json) =>
      CarSuggestionModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarSuggestionEntity object) =>
      CarSuggestionModel(options: object.options, text: object.text).toJson();
}

class OptionsEntity extends Equatable {
  const OptionsEntity({
    this.text = '',
    this.source = const SourceEntity(),
  });

  final String text;
  @JsonKey(name: '_source')
  @SourceConverter()
  final SourceEntity source;

  @override
  List<Object?> get props => [text, source];
}

class OptionsConverter
    implements JsonConverter<OptionsEntity, Map<String, dynamic>?> {
  const OptionsConverter();

  @override
  OptionsEntity fromJson(Map<String, dynamic>? json) =>
      OptionsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(OptionsEntity object) =>
      OptionsModel(source: object.source, text: object.text).toJson();
}

class SourceEntity extends Equatable {
  const SourceEntity({
    this.absoluteCarName = '',
    this.id = -1,
    this.carMake = const CarMakeEntity(),
    this.vehicleType = '',
  });

  final String absoluteCarName;
  final int id;
  @CarMakeConverter()
  final CarMakeEntity carMake;
  final String vehicleType;
  @override
  List<Object?> get props => [absoluteCarName, id, carMake, vehicleType];
}

class SourceConverter
    implements JsonConverter<SourceEntity, Map<String, dynamic>?> {
  const SourceConverter();

  @override
  SourceEntity fromJson(Map<String, dynamic>? json) =>
      SourceModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(SourceEntity object) => SourceModel(
        id: object.id,
        carMake: object.carMake,
        absoluteCarName: object.absoluteCarName,
        vehicleType: object.vehicleType,
      ).toJson();
}
