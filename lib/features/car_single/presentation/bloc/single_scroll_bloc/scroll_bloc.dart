import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'scroll_event.dart';
part 'scroll_state.dart';

class ScrollBloc extends Bloc<ScrollEvent, ScrollState> {
  ScrollBloc() : super(ScrollState()) {
    on<ScrollEvent>((event, emit) {
      state.isScrolled = true;
    });
  }
}
