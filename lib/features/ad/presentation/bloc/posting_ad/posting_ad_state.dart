part of 'posting_ad_bloc.dart';

class PostingAdState extends Equatable {
  final MakeEntity? makeEntity;
  final CarTypeEntity? carTypeEntity;
  final String? letter;
  final int? selectedPopularTypeId;
  final bool isSortByLetter;
  final bool hasAppBarShadow;

  const PostingAdState({
    this.isSortByLetter = false,
    this.hasAppBarShadow = true,
    this.makeEntity,
    this.letter,
    this.carTypeEntity,
    this.selectedPopularTypeId,
  });
  PostingAdState copyWith(
          {bool isSortByLetter = false,
          MakeEntity? makeEntity,
          String? letter,
          CarTypeEntity? carTypeEntity,
          int? selectedPopularTypeId,
          bool? hasAppBarShadow}) =>
      PostingAdState(
        hasAppBarShadow: hasAppBarShadow ?? this.hasAppBarShadow,
        isSortByLetter: isSortByLetter,
        selectedPopularTypeId:
            selectedPopularTypeId ?? this.selectedPopularTypeId,
        carTypeEntity: carTypeEntity ?? this.carTypeEntity,
        makeEntity: makeEntity ?? this.makeEntity,
        letter: letter,
      );
  @override
  List<Object?> get props => [
        makeEntity,
        letter,
        carTypeEntity,
        selectedPopularTypeId,
        hasAppBarShadow
      ];
}
