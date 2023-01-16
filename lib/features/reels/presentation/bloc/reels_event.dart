part of 'reels_bloc.dart';

@immutable
abstract class ReelsEvent {
  const ReelsEvent();
}

class InitialEvent extends ReelsEvent {}

class ChangeStatusEvent extends ReelsEvent {
  final FormzStatus status;

  const ChangeStatusEvent(this.status);
}


class GetReelsEvent extends ReelsEvent {
  final int offset;

  const GetReelsEvent(this.offset);
}
