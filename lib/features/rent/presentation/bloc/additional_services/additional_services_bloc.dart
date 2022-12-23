import 'package:auto/features/rent/domain/entities/additional_services_entity.dart';
import 'package:auto/features/rent/domain/usecases/additional_services_usecase.dart';
import 'package:auto/features/rent/domain/usecases/rent_list_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'additional_services_event.dart';
part 'additional_services_state.dart';

class AdditionalServicesBloc
    extends Bloc<AdditionalServicesEvent, AdditionalServicesState> {
  final AdditionalServiceUseCase useCase;
  AdditionalServicesBloc({required this.useCase})
      : super(const AdditionalServicesState(
            services: [], status: FormzStatus.pure)) {
    on<CheckUncheckEvent>(_onChanged);
    on<GetAdditionalServicesEvent>(_getServices);
  }
  Future<void> _getServices(GetAdditionalServicesEvent event,
      Emitter<AdditionalServicesState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await useCase.call(Params());
    if (result.isRight) {
      emit(state.copyWith(
          services: result.right.results,
          status: FormzStatus.submissionSuccess));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void _onChanged(
      CheckUncheckEvent event, Emitter<AdditionalServicesState> emit) {
    final newServices = List<AdditionalServiceEntity>.generate(
        state.services.length,
        (index) => index == event.index
            ? state.services[event.index].copyWith(isSelected: event.value)
            : state.services[index]);

    emit(state.copyWith(services: newServices));
  }
}
