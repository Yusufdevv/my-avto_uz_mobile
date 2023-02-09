import 'package:auto/features/dealers/domain/entities/dealer_single_entity.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_single_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_single_watch_contact_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dealer_single_event.dart';
part 'dealer_single_bloc.freezed.dart';
part 'dealer_single_state.dart';

class DealerSingleBloc extends Bloc<DealerSingleEvent, DealerSingleState> {
  final DealerSingleUseCase dealerSingleUseCase = DealerSingleUseCase();

  DealerSingleBloc() : super(DealerSingleState()) {
    on<_GetResults>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await dealerSingleUseCase.call(event.slug);
      if (result.isRight) {
        emit(
          state.copyWith(
              status: FormzStatus.submissionSuccess,
              dealerSingleEntity: result.right),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    
  }
}
