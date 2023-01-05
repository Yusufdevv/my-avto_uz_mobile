import 'package:auto/features/main/domain/usecases/read_story_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  ReadStoryUseCase readStoryUseCase = ReadStoryUseCase();

  StoryBloc() : super(const StoryState()) {
    on<ReadEvent>(_onRead);
  }

  void _onRead(ReadEvent event, Emitter<StoryState> emit) {
    readStoryUseCase.call({'itemId': event.itemId});
  }
}
