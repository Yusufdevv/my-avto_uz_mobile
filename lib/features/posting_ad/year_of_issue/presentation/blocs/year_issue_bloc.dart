import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'year_issue_event.dart';

part 'year_issue_state.dart';

class YearIssueBloc extends Bloc<YearIssueEvent, YearIssueState> {
  YearIssueBloc() : super(const YearIssueState(selectedId: -1, confirmId: -1)) {
    on<SelectedYearEvent>((event, emit) {
      emit(state.copyWith(selectedId: event.id));
    });
    on<ConfirmYearEvent>((event, emit) {
      emit(state.copyWith(confirmId: state.selectedId));
    });
    on<RevertYearEvent>((event, emit) {
      emit(state.copyWith(selectedId: state.confirmId));
    });
  }
}
