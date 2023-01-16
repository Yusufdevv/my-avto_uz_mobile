part of 'reels_bloc.dart';

@immutable
abstract class ReelsEvent extends Equatable {
  const ReelsEvent();
}

class InitialEvent extends ReelsEvent {
  @override
  List<Object?> get props => [];
}

class ChangeStatusEvent extends ReelsEvent {
  final FormzStatus status;

  const ChangeStatusEvent(this.status);

  @override
  List<Object?> get props => [status];
}

class GetReelsEvent extends ReelsEvent {
  final int offset;

  const GetReelsEvent(this.offset);

  @override
  List<Object?> get props => [offset];
}
