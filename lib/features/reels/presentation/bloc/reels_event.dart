part of 'reels_bloc.dart';

@immutable
abstract class ReelsEvent extends Equatable {
  const ReelsEvent();
}

class InitialEvent extends ReelsEvent {
  final bool isFromMain;

  const InitialEvent({required this.isFromMain});

  @override
  List<Object?> get props => [isFromMain];
}

class ChangeStatusEvent extends ReelsEvent {
  final FormzStatus status;

  const ChangeStatusEvent(this.status);

  @override
  List<Object?> get props => [status];
}

class GetMoreReelsEvent extends ReelsEvent {
  final bool isFromMain;
  final int offset;

  const GetMoreReelsEvent({
    required this.isFromMain,
    required this.offset,
  });

  @override
  List<Object?> get props => [offset];
}

class ReelsLike extends ReelsEvent {
  final int id;
  final int index;

  const ReelsLike(
    this.id,
    this.index,
  );

  @override
  List<Object?> get props => [id];
}

class ReelsShare extends ReelsEvent {
  final int id;
  final int index;

  const ReelsShare(
    this.id,
    this.index,
  );

  @override
  List<Object?> get props => [id];
}
