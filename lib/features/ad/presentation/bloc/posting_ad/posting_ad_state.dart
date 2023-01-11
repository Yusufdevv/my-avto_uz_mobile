part of 'posting_ad_bloc.dart';

class PostingAdState extends Equatable {
  final MakeEntity? makeEntity;
  final CarTypeEntity? carTypeEntity;
  final String? letter;
  final String? previousMakeLetter;
  final int? selectedPopularTypeId;

  const PostingAdState({
    this.makeEntity,
    this.letter,
    this.previousMakeLetter,
    this.carTypeEntity,
    this.selectedPopularTypeId,
  });
  PostingAdState copyWith(
          {MakeEntity? makeEntity,
          String? letter,
          String? previousMakeLetter,
          CarTypeEntity? carTypeEntity,
          int? selectedPopularTypeId}) =>
      PostingAdState(
        selectedPopularTypeId:
            selectedPopularTypeId ?? this.selectedPopularTypeId,
        carTypeEntity: carTypeEntity ?? this.carTypeEntity,
        makeEntity: makeEntity ?? this.makeEntity,
        letter: letter ?? this.letter,
        previousMakeLetter: previousMakeLetter ?? this.previousMakeLetter,
      );
  @override
  List<Object?> get props => [
        makeEntity,
        letter,
        previousMakeLetter,
        carTypeEntity,
        selectedPopularTypeId
      ];
}
