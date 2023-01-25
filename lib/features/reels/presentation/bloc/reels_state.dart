part of 'reels_bloc.dart';

class ReelsState extends Equatable {
  final List<ReelEntity> reels;
  final FormzStatus statusReelsGet;
  final bool hasNext;

  const ReelsState({
    this.reels = const [],
    this.statusReelsGet = FormzStatus.pure,
    this.hasNext = true,
  });

  ReelsState copWith({
    List<ReelEntity>? reels,
    FormzStatus? statusReelsGet,
    bool? hasNext,
  }) =>
      ReelsState(
        reels: reels ?? this.reels,
        statusReelsGet: statusReelsGet ?? this.statusReelsGet,
        hasNext: hasNext ?? this.hasNext,
      );

  @override
  List<Object?> get props => [
        reels,
        statusReelsGet,
        hasNext,
      ];
}
