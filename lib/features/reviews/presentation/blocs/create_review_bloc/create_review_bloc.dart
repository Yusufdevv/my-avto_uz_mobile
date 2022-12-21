import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/reviews/domain/usecases/create_review_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_review_bloc.freezed.dart';

part 'create_review_event.dart';

part 'create_review_state.dart';

class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewState> {
  final CreateReviewUseCase useCase;

  CreateReviewBloc({required this.useCase}) : super(CreateReviewState()) {
    on<_CreateReview>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(event.model);
      if (result.isRight) {
        emit(state.copyWith(
          entity: result.right.results,
          status: FormzStatus.submissionSuccess,
          count: result.right.results.length,
          next: result.right.next!,
        ));
      }
    });
  }
}
