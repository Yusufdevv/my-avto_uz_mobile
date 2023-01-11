part of 'posting_ad_bloc.dart';

abstract class PostingAdEvent {}

class PostingAdChooseEvent extends PostingAdEvent {
  final CarTypeEntity? carTypeEntity;
  final String? letter;
  final int? popularTypeId;
  final MakeEntity? makeEntity;
  PostingAdChooseEvent({
    this.carTypeEntity,
    this.letter,
    this.makeEntity,
    this.popularTypeId,
  });
}

class PostingAdChangeAppBarShadowEvent extends PostingAdEvent {
  final bool value;
  PostingAdChangeAppBarShadowEvent({required this.value});
}
