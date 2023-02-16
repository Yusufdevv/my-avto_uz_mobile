import 'package:auto/features/search/domain/entities/popular_search_entity.dart';
import 'package:auto/features/search/domain/entities/user_searches_entity.dart';
import 'package:auto/features/search/domain/usecases/popular_searches_usecase.dart';
import 'package:auto/features/search/domain/usecases/user_searches_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_searches_event.dart';
part 'user_searches_state.dart';
part 'user_searches_bloc.freezed.dart';

class UserSearchesBloc extends Bloc<UserSearchesEvent, UserSearchesState> {
  final UserSearchesUseCase useCase = UserSearchesUseCase();
  final PopularSearchesUseCase popularSearchesUseCase =
      PopularSearchesUseCase();
  UserSearchesBloc() : super(UserSearchesState()) {
    on<_GetUserSearches>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(event.search);
      if (result.isRight) {
        emit(
          state.copyWith(
            userSearches: result.right.results,
            status: FormzStatus.submissionSuccess,
            next: result.right.next,
            previous: result.right.previous,
            count: result.right.count,
          ),
        );
      }
    });

    on<_GetPopularSearches>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await popularSearchesUseCase.call(event.search);
      if (result.isRight) {
        emit(
          state.copyWith(
            popularSearches: result.right.results,
            status: FormzStatus.submissionSuccess,
            next: result.right.next,
            previous: result.right.previous,
            count: result.right.count,
          ),
        );
      }
    });
  }
}
