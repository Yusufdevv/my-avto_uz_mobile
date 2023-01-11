import 'dart:async';

import 'package:auto/features/ad/domain/entities/choose_model/car_type_entity.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'posting_ad_event.dart';
part 'posting_ad_state.dart';

class PostingAdBloc extends Bloc<PostingAdEvent, PostingAdState> {
  PostingAdBloc() : super(const PostingAdState()) {
    on<PostingAdChooseMakeEvent>(_makeChoose);
    on<PostingAdChooseLetterEvent>(_letterChoose);
    on<PostingAdChooseCarTypeEvent>(_carTypeChoose);
  }

  void _carTypeChoose(
      PostingAdChooseCarTypeEvent event, Emitter<PostingAdState> emit) {
    emit(state.copyWith(carTypeEntity: event.carTypeEntity));
  }

  void _letterChoose(
      PostingAdChooseLetterEvent event, Emitter<PostingAdState> emit) {
    if (state.previousMakeLetter == event.letter) {
      return;
    }

    emit(
        state.copyWith(letter: event.letter, previousMakeLetter: state.letter));
  }

  void _makeChoose(
          PostingAdChooseMakeEvent event, Emitter<PostingAdState> emit) =>
      emit(state.copyWith(makeEntity: event.makeEntity));
}
