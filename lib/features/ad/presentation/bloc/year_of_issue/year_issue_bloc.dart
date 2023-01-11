import 'package:auto/features/ad/domain/entities/years/years.dart';
import 'package:auto/features/ad/domain/usecases/get_years.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'year_issue_event.dart';

part 'year_issue_state.dart';

class YearIssueBloc extends Bloc<YearIssueEvent, YearIssueState> {
  final int modelId;
  final GetYearsUseCase getYearsUseCase;

  YearIssueBloc({required this.getYearsUseCase, required this.modelId})
      : super(const YearIssueState(
            selectedId: -1, confirmId: -1, status: FormzStatus.pure,yearsEntity: [])) {
    on<YearsIssueGetEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result =
          await getYearsUseCase.call(YearsParams(modelId: 10, next: ''));
      if (result.isRight) {
        result.right;
        emit(state.copyWith(yearsEntity: result.right.results,status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
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
