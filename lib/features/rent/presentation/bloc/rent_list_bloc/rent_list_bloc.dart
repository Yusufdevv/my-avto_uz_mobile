import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:auto/features/rent/domain/usecases/rent_list_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rent_list_event.dart';
part 'rent_list_state.dart';
part 'rent_list_bloc.freezed.dart';

class RentListBloc extends Bloc<RentListEvent, RentListState> {
  final RentListUseCase rentListUseCase;
  RentListBloc(this.rentListUseCase) : super(RentListState()) {
    on<_GetResults>((event, emit) async {
      if (!event.isRefresh) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
      }
      final result = await rentListUseCase('');
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            list: result.right.results,
            count: result.right.count,
            next: result.right.next));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetMoreResults>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await rentListUseCase(state.next!);
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            list: [...state.list, ...result.right.results],
            count: result.right.count,
            next: result.right.next));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
