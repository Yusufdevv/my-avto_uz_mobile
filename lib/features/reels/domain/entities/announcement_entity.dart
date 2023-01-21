import 'package:auto/features/reels/data/models/announcement_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class AnnouncementEntity extends Equatable {
  final int id;
  final String price;
  final String discount;
  final String currency;

  const AnnouncementEntity({
    this.id = -1,
    this.price = '0',
    this.discount = '0',
    this.currency = '',
  });

  @override
  List<Object?> get props => [id, price, currency, discount];
}

class AnnouncementConverter
    implements JsonConverter<AnnouncementEntity, Map<String, dynamic>?> {
  const AnnouncementConverter();

  @override
  AnnouncementEntity fromJson(Map<String, dynamic>? json) =>
      AnnouncementModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(AnnouncementEntity object) => {};
}
