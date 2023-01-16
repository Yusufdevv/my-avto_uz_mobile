part of 'video_player_bloc.dart';

class VideoPlayerState extends Equatable {
  final Duration position;
  final Duration totalDuration;
  final bool isPlaying;
  final int totalLikes;

  const VideoPlayerState(
      {required this.isPlaying,
      required this.position,
      required this.totalLikes,
      required this.totalDuration});

  VideoPlayerState copyWith({
    Duration? position,
    int? totalLikes,
    Duration? totalDuration,
    bool? isPlaying,
  }) =>
      VideoPlayerState(
          isPlaying: isPlaying ?? this.isPlaying,
          totalLikes: totalLikes ?? this.totalLikes,
          position: position ?? this.position,
          totalDuration: totalDuration ?? this.totalDuration);

  @override
  List<Object?> get props => [position, totalDuration, isPlaying, totalLikes];
}
