import 'package:auto/features/reels/domain/entities/reel_entity.dart';
import 'package:auto/features/reels/domain/usecases/get_reels_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'reels_event.dart';

part 'reels_state.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  GetReelsUseCase getReelsUseCase = GetReelsUseCase();

  ReelsBloc() : super(const ReelsState()) {
    on<InitialEvent>(_onInit);
    on<GetReelsEvent>(_onGetReels);
    on<ChangeStatusEvent>(_onChangeStatus);
  }

  Future _onInit(InitialEvent event, Emitter<ReelsState> emit) async {
    await _getReels(0, emit);
  }

  Future _onGetReels(GetReelsEvent event, Emitter<ReelsState> emit) async {
    await _getReels(event.offset, emit);
  }

  Future _onChangeStatus(
      ChangeStatusEvent event, Emitter<ReelsState> emit) async {
    emit(state.copWith(statusReelsGet: event.status));
  }

  Future _getReels(int offset, Emitter<ReelsState> emit) async {
    add(const ChangeStatusEvent(FormzStatus.submissionInProgress));
    final result = await getReelsUseCase.call({'limit': 10, 'offset': offset});
    if (result.isRight) {
      emit(state.copWith(
        reels: result.right.results,
        statusReelsGet: FormzStatus.submissionSuccess,
      ));
    } else {
      emit(state.copWith(statusReelsGet: FormzStatus.submissionFailure));
    }
  }
}
