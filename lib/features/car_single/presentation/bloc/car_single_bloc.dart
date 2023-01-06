import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_single_bloc.freezed.dart';
part 'car_single_event.dart';
part 'car_single_state.dart';

class CarSingleBloc extends Bloc<CarSingleEvent, CarSingleState> {
  final GetCarSingleUseCase useCaseSingle;

  CarSingleBloc(this.useCaseSingle) : super(const CarSingleState()) {
    on<_GetSingle>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCaseSingle.call(event.id);
      if (result.isRight) {
    
        emit(state.copyWith(
            singleEntity: result.right, status: FormzStatus.submissionSuccess));
      } else {
        print('BLOC ERROR GET SINGLE');
      }
    });
  }
}
