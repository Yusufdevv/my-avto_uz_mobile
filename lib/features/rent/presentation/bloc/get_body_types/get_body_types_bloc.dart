import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/usecases/get_body_type.dart';
import 'package:auto/features/rent/domain/usecases/get_body_types_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
part 'get_body_types_event.dart';
part 'get_body_types_state.dart';

class GetBodyTypesBloc extends Bloc<GetBodyTypesEvent, GetBodyTypesState> {
  final int selectedId;
  final GetBodyTypesUseCase getBodyTypeUseCase;
  GetBodyTypesBloc({required this.getBodyTypeUseCase, required this.selectedId})
      : super(
            const GetBodyTypesState(status: FormzStatus.pure, bodyTypes: [])) {
    on<GetBodyTypesSelectIndex>(
        (event, emit) => emit(state.copyWith(selected: event.index)));
    on<GetBodyTypesGetEvent>((event, emit) async {
      print('=>=>=>=> get body types event triggerred <=<=<=<=');
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getBodyTypeUseCase.call(NoParams());
      if (result.isRight) {
        emit(
          state.copyWith(
            selected: result.right.results
                .indexWhere((element) => element.id == selectedId),
            status: FormzStatus.submissionSuccess,
            bodyTypes: result.right.results,
          ),
        );
      } else {
        print("got result is left ${result.left.toString()}");
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
