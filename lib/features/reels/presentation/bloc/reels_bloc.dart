import 'package:auto/features/reels/domain/entities/reel_entity.dart';
import 'package:auto/features/reels/domain/usecases/get_of_day_use_case.dart';
import 'package:auto/features/reels/domain/usecases/get_reels_use_case.dart';
import 'package:auto/features/reels/domain/usecases/reels_like_usecase.dart';
import 'package:auto/features/reels/domain/usecases/reels_share_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'reels_event.dart';

part 'reels_state.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  GetReelsUseCase getReelsUseCase = GetReelsUseCase();
  GetReelsOfDayUseCase getReelsOfDayUseCase = GetReelsOfDayUseCase();
  ReelsLikeUsecase reelsLikeUseCase = ReelsLikeUsecase();
  ReelsShareUsecase reelsShareUsecase = ReelsShareUsecase();

  ReelsBloc() : super(const ReelsState()) {
    on<InitialEvent>(_onInit);
    on<GetMoreReelsEvent>(_onGetMoreReels);
    on<ChangeStatusEvent>(_onChangeStatus);
    on<ReelsLike>(_likeReels);
    on<ReelsShare>(_shareReels);
  }

  Future _onInit(InitialEvent event, Emitter<ReelsState> emit) async {
    await _getReels(0, event.isFromMain, emit);
  }

  Future _onGetMoreReels(
      GetMoreReelsEvent event, Emitter<ReelsState> emit) async {
    await _getReels(event.offset, event.isFromMain, emit);
  }

  Future _onChangeStatus(
      ChangeStatusEvent event, Emitter<ReelsState> emit) async {
    emit(state.copWith(statusReelsGet: event.status));
  }

  Future _getReels(
      int offset, bool isFromMain, Emitter<ReelsState> emit) async {
    add(const ChangeStatusEvent(FormzStatus.submissionInProgress));
    final result = isFromMain
        ? await getReelsOfDayUseCase.call({'limit': 10, 'offset': offset})
        : await getReelsUseCase.call({'limit': 10, 'offset': offset});
    if (result.isRight) {
      emit(state.copWith(
        reels: result.right.results,
        statusReelsGet: FormzStatus.submissionSuccess,
      ));
    } else {
      emit(state.copWith(statusReelsGet: FormzStatus.submissionFailure));
    }
  }

  Future _likeReels(ReelsLike event, Emitter<ReelsState> emit) async {
    final result = await reelsLikeUseCase.call(event.id);
    if (result.isRight) {
      final reel = state.reels[event.index];
      if (reel.isLiked) {
        reel.isLiked = false;
        reel.likeCount--;
      } else {
        reel.isLiked = true;
        reel.likeCount++;
      }
      final list = <ReelEntity>[...state.reels];
      list[event.index] = reel;
      emit(state.copWith(reels: list));
    }
  }

  Future _shareReels(ReelsShare event, Emitter<ReelsState> emit) async {
    final result = await reelsShareUsecase.call(event.id);
    if (result.isRight) {
      final reel = state.reels[event.index];
      reel.shareCount = result.right.reel;
      final list = <ReelEntity>[...state.reels];
      list[event.index] = reel;
      emit(state.copWith(reels: list));
    }
  }
}
