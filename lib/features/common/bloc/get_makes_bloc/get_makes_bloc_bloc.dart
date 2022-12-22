import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/common/entities/makes_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_makes_bloc_event.dart';
part 'get_makes_bloc_state.dart';
part 'get_makes_bloc_bloc.freezed.dart';

class GetMakesBloc extends Bloc<GetMakesBlocEvent, GetMakesState> {
  final GetMakesUseCase useCase;
  GetMakesBloc({required this.useCase}) : super(GetMakesState()) {
    on<_GetMakes>((event, emit) async{
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(NoParams());
      if (result.isRight) {
        emit(
          state.copyWith(
            makes: result.right,
            status: FormzStatus.submissionSuccess,
            count: result.right.count,
            next: result.right.next,
          ),
        );
      }
    });
  }
}
