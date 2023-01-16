part of 'reels_bloc.dart';

class ReelsState extends Equatable {
  final List<ReelEntity> reels;
  final FormzStatus statusReelsGet;

  const ReelsState({
    this.reels = const [],
    this.statusReelsGet = FormzStatus.pure,
  });

  ReelsState copWith({
    List<ReelEntity>? reels,
    FormzStatus? statusReelsGet,
  }) =>
      ReelsState(
        reels: reels ?? this.reels,
        statusReelsGet: statusReelsGet ?? this.statusReelsGet,
      );

  @override
  List<Object?> get props => [
        reels,
        statusReelsGet,
      ];
}
