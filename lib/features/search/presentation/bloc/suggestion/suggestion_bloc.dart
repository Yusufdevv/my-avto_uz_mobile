import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';
part 'suggestion_bloc.freezed.dart';



class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  SuggestionBloc() : super(SuggestionState()) {
    on<SuggestionEvent>((event, emit) {
    });
  }
}
