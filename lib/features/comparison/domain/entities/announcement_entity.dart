import 'package:auto/features/comparison/data/models/announcement_model.dart';
import 'package:auto/features/comparison/domain/entities/engine_data_entity.dart';
import 'package:auto/features/comparison/domain/entities/main_data_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class AnnouncementsEntity extends Equatable {
  const AnnouncementsEntity({
    this.mainData = const MainDataEntity(),
    this.engineData = const EngineDataEntity(),
    this.dimensions,
    this.volumeAndMass,
    this.suspensionsAndBrakes,
    this.other,
    this.id = -1,
    this.licenceType = '',
    this.ownership = '',
    this.isRegisteredLocally = false,
    this.isNew = false,
    this.price = '',
    this.currency = '',
  });

  @MainDataConverter()
  final MainDataEntity mainData;
  @EngineDataConverter()
  final EngineDataEntity engineData;
  final dynamic dimensions;
  final dynamic volumeAndMass;
  final dynamic suspensionsAndBrakes;
  final dynamic other;
  final int id;
  final String licenceType;
  final String ownership;
  final bool isRegisteredLocally;
  final bool isNew;
  final String price;
  final String currency;

  @override
  List<Object?> get props => [
        mainData,
        engineData,
        dimensions,
        volumeAndMass,
        suspensionsAndBrakes,
        other,
        id,
        licenceType,
        ownership,
        isRegisteredLocally,
        isNew,
        price,
        currency,
      ];
}

class AnnouncementsConverter
    implements JsonConverter<AnnouncementsEntity, Map<String, dynamic>?> {
  const AnnouncementsConverter();
  @override
  AnnouncementsEntity fromJson(Map<String, dynamic>? json) =>
      AnnouncementsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(AnnouncementsEntity object) => {};
}
