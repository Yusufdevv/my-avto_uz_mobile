import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/common/entities/makes_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_car_model_event.dart';
part 'get_car_model_state.dart';
part 'get_car_model_bloc.freezed.dart';

class GetCarModelBloc extends Bloc<GetCarModelEvent, GetCarModelState> {
  final GetCarModelUseCase useCase;
  GetCarModelBloc({required this.useCase}) : super(GetCarModelState()) {
    on<_GetCarModel>((event, emit) async{
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(state.getModel);
      if (result.isRight) {
        emit(
          state.copyWith(
            model: result.right,
            status: FormzStatus.submissionSuccess,
            count: result.right.count,
            next: result.right.next,
          ),
        );
      }
    });
  }
}
