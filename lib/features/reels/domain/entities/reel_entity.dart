import 'package:auto/features/reels/data/models/reel_model.dart';
import 'package:auto/features/reels/domain/entities/announcement_entity.dart';
import 'package:auto/features/reels/domain/entities/dealer_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ReelEntity extends Equatable {
  final int id;
  final String title;
  final String content;
  final int likeCount;
  final int shareCount;
  @DealerConverter()
  final DealerEntity dealer;
  @AnnouncementConverter()
  final AnnouncementEntity announcement;
  final bool hasDiscount;
  final String oldPrice;
  final int discountPercent;
  final bool isLiked;
  final bool isOfferOfTheDay;

  const ReelEntity({
    this.id = -1,
    this.title = '',
    this.content = '',
    this.likeCount = 0,
    this.shareCount = 0,
    this.dealer = const DealerEntity(),
    this.announcement = const AnnouncementEntity(),
    this.hasDiscount = false,
    this.oldPrice = '0',
    this.discountPercent = 0,
    this.isLiked = true,
    this.isOfferOfTheDay = false,
  });

  ReelEntity copyWith({
    int? likeCount,
    int? shareCount,
    bool? isLiked,
  }) =>
      ReelEntity(
        id: id,
        title: title,
        content: content,
        likeCount: likeCount ?? this.likeCount,
        shareCount: shareCount ?? this.shareCount,
        dealer: dealer,
        announcement: announcement,
        hasDiscount: hasDiscount,
        oldPrice: oldPrice,
        discountPercent: discountPercent,
        isLiked: isLiked ?? this.isLiked,
        isOfferOfTheDay: isOfferOfTheDay,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        likeCount,
        shareCount,
        announcement,
        isLiked,
        isOfferOfTheDay,
      ];
}

class ReelConverter
    implements JsonConverter<ReelEntity, Map<String, dynamic>?> {
  const ReelConverter();

  @override
  ReelEntity fromJson(Map<String, dynamic>? json) =>
      ReelModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(ReelEntity object) => {};
}
