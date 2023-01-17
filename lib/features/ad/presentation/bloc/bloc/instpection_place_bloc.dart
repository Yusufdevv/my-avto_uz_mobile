import 'dart:async';

import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/usecases/get_regions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'instpection_place_event.dart';
part 'instpection_place_state.dart';

class InspectionPlaceBloc
    extends Bloc<InstpectionPlaceEvent, InspectionPlaceState> {
  final GetRegionsUseCase getRegions;
  InspectionPlaceBloc({required this.getRegions})
      : super(const InspectionPlaceState(status: FormzStatus.pure,cityStatus: FormzStatus.invalid)) {
    on<InstpectionPlaceGetRegionsEvent>(_getRegions);
    on<InstpectionPlaceGetCitiesEvent>(_getCities);
  }
  FutureOr<void> _getCities(InstpectionPlaceGetCitiesEvent event,
      Emitter<InspectionPlaceState> emit) async {
    print('=>=>=>=> get cities triggered <=<=<=<=');
    emit(state);
  }

  FutureOr<void> _getRegions(InstpectionPlaceGetRegionsEvent event,
      Emitter<InspectionPlaceState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await getRegions.call('');
    if (result.isRight) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          regions: result.right.results,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
