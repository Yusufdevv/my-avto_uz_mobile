part of 'video_player_bloc.dart';

abstract class VideoPlayerEvent extends Equatable {
  const VideoPlayerEvent();
}

class VideoPlayPauseEvent extends VideoPlayerEvent {
  final bool isPlaying;

  const VideoPlayPauseEvent({required this.isPlaying});

  @override
  List<Object?> get props => [isPlaying];
}

class InitializeVideoPlayerEvent extends VideoPlayerEvent {
  final Duration totalDuration;

  const InitializeVideoPlayerEvent({required this.totalDuration});

  @override
  List<Object?> get props => [totalDuration];
}

class SeekEvent extends VideoPlayerEvent {
  final Duration position;

  const SeekEvent({required this.position});

  @override
  List<Object?> get props => [position];
}

class GetTotalLikes extends VideoPlayerEvent {
  final int incrementLikes;

  const GetTotalLikes({required this.incrementLikes});

  @override
  List<Object?> get props => [];
}
