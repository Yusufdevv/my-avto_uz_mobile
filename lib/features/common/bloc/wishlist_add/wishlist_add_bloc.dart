import 'package:auto/features/common/usecases/add_wishlist_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_add_event.dart';

part 'wishlist_add_state.dart';

part 'wishlist_add_bloc.freezed.dart';

class WishlistAddBloc extends Bloc<WishlistAddEvent, WishlistAddState> {
  final AddWishlistUseCase useCase;
  final RemoveWishlistUseCase removeWishlistUseCase;

  WishlistAddBloc({required this.useCase, required this.removeWishlistUseCase}) : super(WishlistAddState()) {
    on<_AddWishlist>((event, emit) async {
      emit(state.copyWith(addStatus: FormzStatus.submissionInProgress));
      final result = await useCase.call(event.id);
      if (result.isRight) {
        emit(
          state.copyWith(addStatus: FormzStatus.submissionSuccess),
        );
      } else {
        emit(state.copyWith(addStatus: FormzStatus.submissionFailure));
      }
    });

    on<_RemoveWishlist>((event, emit) async {
      emit(state.copyWith(removeStatus: FormzStatus.submissionInProgress));
      final result = await removeWishlistUseCase.call(event.id);
      if (result.isRight) {
        emit(
          state.copyWith(removeStatus: FormzStatus.submissionSuccess),
        );
      } else {
        emit(state.copyWith(removeStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
