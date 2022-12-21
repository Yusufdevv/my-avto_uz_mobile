import 'package:auto/features/search/domain/entities/suggestion_entity.dart';
import 'package:auto/features/search/domain/usecases/suggestion_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';
part 'suggestion_bloc.freezed.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  final SuggestionUseCase useCase;
  SuggestionBloc({required this.useCase}) : super(SuggestionState()) {


    on<_GetSuggestions>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(event.search);
      if (result.isRight) {
        emit(
          state.copyWith(
            suggestions: result.right,
            status: FormzStatus.submissionSuccess,
           
          ),
        );
      }
    });
  }
}
