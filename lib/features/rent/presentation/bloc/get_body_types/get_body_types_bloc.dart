import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/rent/domain/usecases/get_body_types_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'get_body_types_event.dart';
part 'get_body_types_state.dart';

class GetBodyTypesBloc extends Bloc<GetBodyTypesEvent, GetBodyTypesState> {
  final GetBodyTypesUseCase getBodyTypeUseCase;
  GetBodyTypesBloc({required this.getBodyTypeUseCase})
      : super(
            const GetBodyTypesState(status: FormzStatus.pure, bodyTypes: [])) {
    on<GetBodyTypesEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getBodyTypeUseCase.call(NoParams());
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            bodyTypes: result.right.results,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
