import 'package:auto/features/dealers/data/models/marks_with_ads_model.dart';
import 'package:auto/features/dealers/domain/entities/make_entity.dart';
import 'package:auto/features/dealers/domain/entities/marks_in_dealer_entity.dart';
import 'package:auto/features/dealers/domain/usecases/marks_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'marks_in_dealers_event.dart';
part 'marks_in_dealers_state.dart';
part 'marks_in_dealers_bloc.freezed.dart';

class MarksInDealersBloc extends Bloc<MarksInDealersEvent, MarksInDealersState> {
  final MarksInDealerUseCase marksInDealerUseCase;

  MarksInDealersBloc({required this.marksInDealerUseCase})
      : super(MarksInDealersState()) {
    on<_GetResults>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await marksInDealerUseCase.call(event.slug);
      if (result.isRight) {
        emit(
          state.copyWith(
              status: FormzStatus.submissionSuccess, marks: result.right.results),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}

