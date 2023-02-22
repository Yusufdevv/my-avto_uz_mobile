import 'package:auto/assets/colors/color.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'scrolling_event.dart';
part 'scrolling_state.dart';

class ScrollingBloc extends Bloc<ScrollingEvent, ScrollingState> {
  ScrollingBloc() : super(const ScrollingState(color: Colors.transparent)) {
    on<ChangeColorEvent>((event, emit) {
      if (event.offset > 182 && event.offset >= 185) {
        emit(state.copyWith(color: white));
      } else if (event.offset <= 180 && event.offset > 10) {
        emit(state.copyWith(color: Colors.transparent));
      }
    });
  }
}
