import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/reviews/domain/usecases/my_review_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_review_bloc.freezed.dart';

part 'my_review_event.dart';

part 'my_review_state.dart';

class MyReviewsBloc extends Bloc<MyReviewsEvent, MyReviewsState> {
  final MyReviewsUseCase useCase;

  MyReviewsBloc({required this.useCase}) : super(MyReviewsState()) {
    on<_GetMyReviews>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(event.search);
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
