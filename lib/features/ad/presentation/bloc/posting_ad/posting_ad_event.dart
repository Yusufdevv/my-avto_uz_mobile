part of 'posting_ad_bloc.dart';

abstract class PostingAdEvent {}

class PostingAdChooseMakeEvent extends PostingAdEvent {
  final MakeEntity makeEntity;
  PostingAdChooseMakeEvent({required this.makeEntity});
}

class PostingAdChooseLetterEvent extends PostingAdEvent {
  final String letter;
  PostingAdChooseLetterEvent({required this.letter});
}

class PostingAdChooseCarTypeEvent extends PostingAdEvent {
  final CarTypeEntity carTypeEntity;
  PostingAdChooseCarTypeEvent({required this.carTypeEntity});
}
