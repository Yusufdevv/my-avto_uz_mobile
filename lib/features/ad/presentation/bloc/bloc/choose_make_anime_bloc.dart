import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'choose_make_anime_event.dart';
part 'choose_make_anime_state.dart';

class ChooseMakeAnimeBloc
    extends Bloc<ChooseMakeAnimeEvent, ChooseMakeAnimeState> {
  ChooseMakeAnimeBloc({
    required Animation<double> reversScaleAnimation,
    required Animation<double> scaleAnimation,
    required AnimationController animationController,
  }) : super(
          ChooseMakeAnimeState(
            isAnimating: false,
            isCollapsed: false,
            reversScaleAnimation: reversScaleAnimation,
            animationController: animationController,
            scaleAnimation: scaleAnimation,
          ),
        ) {
    on<ChooseMakeAnimeChangeParamsEvent>(_changeParams);
  }
  FutureOr<void> _changeParams(ChooseMakeAnimeChangeParamsEvent event,
      Emitter<ChooseMakeAnimeState> emit) {
    emit(
      state.copyWith(
        isAnimating: event.isAnimating,
        isCollapsed: event.isCollapsed,
      ),
    );
  }
}
