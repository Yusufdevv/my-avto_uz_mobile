import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'choose_make_anime_event.dart';
part 'choose_make_anime_state.dart';

class ChooseMakeAnimeBloc
    extends Bloc<ChooseMakeAnimeEvent, ChooseMakeAnimeState> {
  ChooseMakeAnimeBloc()
      : super(const ChooseMakeAnimeState(
            isAnimating: false, isCollapsed: false, reversScaleAnimation: null)) {
    on<ChooseMakeAnimeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
