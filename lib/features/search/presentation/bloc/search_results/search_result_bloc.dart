import 'dart:async';

import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';


part 'search_result_event.dart';
part 'search_result_state.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  SearchResultBloc() : super(SearchResultState()) {
    on<SearchResultEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
