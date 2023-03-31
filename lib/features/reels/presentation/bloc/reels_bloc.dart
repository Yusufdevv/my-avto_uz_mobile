import 'dart:developer';

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
    await _getReels(0, event.isForOfferDay, emit);
  }

  Future _onGetMoreReels(
      GetMoreReelsEvent event, Emitter<ReelsState> emit) async {
    await _getReels(event.offset, event.isForOfferDay, emit);
  }

  Future _onChangeStatus(
      ChangeStatusEvent event, Emitter<ReelsState> emit) async {
    emit(state.copWith(statusReelsGet: event.status));
  }

  Future _getReels(
      int offset, bool isFromMain, Emitter<ReelsState> emit) async {
    log(':::::::::: GET REELS TRIGGERED}  ::::::::::');
    add(const ChangeStatusEvent(FormzStatus.submissionInProgress));
    log(':::::::::: isFromMain $isFromMain}  ::::::::::');
    final result = isFromMain
        ? await getReelsOfDayUseCase.call({'limit': 10, 'offset': offset})
        : await getReelsUseCase.call({'limit': 10, 'offset': offset});

    if (result.isRight) {
      log(':::::::::: REELS LENTH  ${result.right.results.length}  ::::::::::');
      emit(state.copWith(
        reels: result.right.results,
        statusReelsGet: FormzStatus.submissionSuccess,
        hasNext: result.right.next != null,
      ));
    } else {
      emit(state.copWith(statusReelsGet: FormzStatus.submissionFailure));
    }
  }

  Future _likeReels(ReelsLike event, Emitter<ReelsState> emit) async {
    final result = await reelsLikeUseCase.call(event.id);
    if (result.isRight) {
      final reel = state.reels[event.index];
      ReelEntity r;
      if (reel.isLiked) {
        r = reel.copyWith(likeCount: reel.likeCount - 1, isLiked: false);
      } else {
        r = reel.copyWith(likeCount: reel.likeCount + 1, isLiked: true);
      }
      final list = <ReelEntity>[...state.reels];
      list[event.index] = r;
      emit(state.copWith(reels: list));
    }
  }

  Future _shareReels(ReelsShare event, Emitter<ReelsState> emit) async {
    final result = await reelsShareUsecase.call(event.id);
    if (result.isRight) {
      final reel = state.reels[event.index];
      final r = reel.copyWith(shareCount: reel.shareCount + 1);
      final list = <ReelEntity>[...state.reels];
      list[event.index] = r;
      emit(state.copWith(reels: list));
    }
  }
}
