import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:auto/features/rent/domain/usecases/rent_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'commercial_event.dart';
part 'commercial_state.dart';
part 'commercial_bloc.freezed.dart';

class CommercialBloc extends Bloc<CommercialEvent, CommercialState> {
  final RentUseCase rentUseCase;
  final int id;

  CommercialBloc(this.rentUseCase, this.id) : super(CommercialState()) {
    on<_GetResults>((event, emit) async {
      if (!event.isRefresh) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
      }
      final result = await rentUseCase(Param(next: '', id: id));
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          list: result.right.results,
          count: result.right.count,
          next: result.right.next,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetMoreResults>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await rentUseCase(Param(next: state.next!, id: id));
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          list: [...state.list, ...result.right.results],
          count: result.right.count,
          next: result.right.next,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
