import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/entities/other_ads_entity.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'car_single_event.dart';
part 'car_single_state.dart';

class CarSingleBloc extends Bloc<CarSingleEvent, CarSingleState> {
  final GetAdsUseCase useCase;

  CarSingleBloc(this.useCase)
      : super(const CarSingleState(
          status: FormzStatus.pure,
          entity: CarSingleEntity(),
          images: [],
          otherEntity: [],
        )) {
    on<GetCarSingleEvent>((event, emit) async {
      final result = await useCase.call(NoParams());
    });
  }
}
