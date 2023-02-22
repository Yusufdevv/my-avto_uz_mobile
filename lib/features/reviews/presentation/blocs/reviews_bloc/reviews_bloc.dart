import 'package:auto/features/common/domain/model/auto_review_model.dart';
import 'package:auto/features/reviews/data/models/reviews_model.dart';
import 'package:auto/features/reviews/domain/usecases/reviews_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reviews_bloc.freezed.dart';

part 'reviews_event.dart';

part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final ReviewsUseCase useCase;

  ReviewsBloc({required this.useCase}) : super(ReviewsState()) {
    on<_GetReviews>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(ReviewsModel(
          generation: event.model.generation,
          make: event.model.make,
          model: event.model.model,
          search: event.model.search,
          year: event.model.year));
      if (result.isRight) {
        emit(state.copyWith(
            entity: result.right.results,
            status: FormzStatus.submissionSuccess,
            count: result.right.count));
      }
    });
  }
}
