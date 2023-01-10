import 'package:auto/features/main/domain/entities/story_entity.dart';
import 'package:auto/features/main/domain/usecases/get_stories_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  GetStoriesUseCase getStoriesUseCase = GetStoriesUseCase();

  MainBloc() : super(const MainState()) {
    on<InitialEvent>(_onInit);
    on<ChangeStatusEvent>(_onChangeStatus);
  }

  Future _onInit(InitialEvent event, Emitter<MainState> emit) async {
    await _getStories(emit);
  }

  Future _onChangeStatus(ChangeStatusEvent event, Emitter<MainState> emit) async {
    emit(state.copWith(statusStoriesGet: event.status));
  }

  Future _getStories(Emitter<MainState> emit) async {
    add(const ChangeStatusEvent(FormzStatus.submissionInProgress));
    final result = await getStoriesUseCase.call({'limit': 100, 'offset': 0});
    if (result.isRight) {
      emit(state.copWith(stories: result.right.results, statusStoriesGet: FormzStatus.submissionSuccess));
    } else {
      emit(state.copWith(statusStoriesGet: FormzStatus.submissionFailure));
    }
  }
}
