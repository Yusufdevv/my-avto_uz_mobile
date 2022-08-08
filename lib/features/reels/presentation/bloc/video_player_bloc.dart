import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc() : super(const VideoPlayerState(isPlaying: false, position: Duration( seconds: 0), totalDuration: Duration( seconds: 0), totalLikes: 0)) {
    on<InitializeVideoPlayerEvent>((event, emit) {
      emit(state.copyWith(totalDuration: event.totalDuration));
    });
    on<VideoPlayPauseEvent>((event, emit) {
      emit(state.copyWith(isPlaying: event.isPlaying));
    });
    on<SeekEvent>((event, emit) {
      emit(state.copyWith(position: event.position));
    });
    on<GetTotalLikes>((event, emit) {
      emit(state.copyWith(totalLikes: event.incrementLikes + 1));
    });
  }
}
