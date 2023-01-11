import 'dart:async';

import 'package:auto/features/ad/domain/entities/choose_model/car_type_entity.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'posting_ad_event.dart';
part 'posting_ad_state.dart';

class PostingAdBloc extends Bloc<PostingAdEvent, PostingAdState> {
  PostingAdBloc() : super(const PostingAdState()) {
    on<PostingAdChangeAppBarShadowEvent>(_changeAppBarShadow);
    on<PostingAdChooseEvent>(_choose);
  }
  void _changeAppBarShadow(
      PostingAdChangeAppBarShadowEvent event, Emitter<PostingAdState> emit) {
    emit(state.copyWith(hasAppBarShadow: event.value));
  }

  void _choose(PostingAdChooseEvent event, Emitter<PostingAdState> emit) {
    emit(
      state.copyWith(
        isSortByLetter: event.letter != state.letter,
        carTypeEntity: event.carTypeEntity,
        letter: event.letter,
        makeEntity: event.makeEntity,
        selectedPopularTypeId: event.popularTypeId,
      ),
    );
  }
}
