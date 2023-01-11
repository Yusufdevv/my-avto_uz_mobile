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
      emit(state.copyWith(addStatus: FormzStatus.submissionInProgress, id: event.id, index: event.index));
      final result = await useCase.call(event.id);
      if (result.isRight) {
        emit(
          state.copyWith(addStatus: FormzStatus.submissionSuccess, id: event.id, index: event.index),
        );
      } else {
        emit(state.copyWith(addStatus: FormzStatus.submissionFailure, id: event.id, index: event.index));
      }
    });
    on<_RemoveWishlist>((event, emit) async {
      emit(state.copyWith(removeStatus: FormzStatus.submissionInProgress));
      final result = await removeWishlistUseCase.call(Params(endpoint: event.endpoint, id: event.id));
      if (result.isRight) {
        emit(
          state.copyWith(removeStatus: FormzStatus.submissionSuccess, id: event.id, index: event.index),
        );
      } else {
        emit(state.copyWith(removeStatus: FormzStatus.submissionFailure, id: event.id, index: event.index));
      }
    });
    on<_ClearState>(_onClear);
  }

  void _onClear(_ClearState event, Emitter<WishlistAddState> emit) {
    emit(state.copyWith(
      addStatus: FormzStatus.pure,
      removeStatus: FormzStatus.pure,
      id: -1,
      index: -1,
    ));
  }
}
