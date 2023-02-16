import 'package:auto/features/dealers/domain/entities/user_search.dart';
import 'package:auto/features/dealers/domain/usecases/user_search_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_search_dealer_event.dart';
part 'user_search_dealer_state.dart';
part 'user_search_dealer_bloc.freezed.dart';

class UserSearchDealerBloc
    extends Bloc<UserSearchDealerEvent, UserSearchDealerState> {
  final UserSearchUseCase useCase;
  UserSearchDealerBloc({required this.useCase})
      : super(UserSearchDealerState()) {
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

    // on<_GetPopularSearches>((event, emit) async {
    //   emit(state.copyWith(status: FormzStatus.submissionInProgress));
    //   final result = await popularSearchesUseCase.call(event.search);
    //   if (result.isRight) {
    //     emit(
    //       state.copyWith(
    //         popularSearches: result.right.results,
    //         status: FormzStatus.submissionSuccess,
    //         next: result.right.next,
    //         previous: result.right.previous,
    //         count: result.right.count,
    //       ),
    //     );
    //   }
    // });
  }
}
