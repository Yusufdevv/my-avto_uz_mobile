import 'dart:async';

import 'package:auto/features/ad/domain/entities/district_entity.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/usecases/get_districts_usecase.dart';
import 'package:auto/features/common/usecases/get_regions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'instpection_place_event.dart';
part 'instpection_place_state.dart';

class InspectionPlaceBloc
    extends Bloc<InstpectionPlaceEvent, InspectionPlaceState> {
  final GetRegionsUseCase getRegions;
  final GetDistrictsUseCase districtUseCase;
  InspectionPlaceBloc({
    required this.getRegions,
    required this.districtUseCase,
  }) : super(const InspectionPlaceState(
            getRegionsStatus: FormzStatus.pure,
            getDistrictsStatus: FormzStatus.invalid)) {
    on<InstpectionPlaceGetRegionsEvent>(_getRegions);
    on<InstpectionPlaceGetCitiesEvent>(_getCities);
    on<InstpectionPlaceGetDistrictsEvent>(_getDistricts);
  }

  FutureOr<void> _getDistricts(InstpectionPlaceGetDistrictsEvent event,
      Emitter<InspectionPlaceState> emit) async {
    emit(state.copyWith(getDistrictsStatus: FormzStatus.submissionInProgress));
    final result = await districtUseCase.call(event.regionId);

    if (result.isRight) {
      emit(state.copyWith(
          getDistrictsStatus: FormzStatus.submissionSuccess,
          districts: result.right.results));
    } else {
      emit(state.copyWith(getDistrictsStatus: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getCities(InstpectionPlaceGetCitiesEvent event,
      Emitter<InspectionPlaceState> emit) async {
    emit(state);
  }

  FutureOr<void> _getRegions(InstpectionPlaceGetRegionsEvent event,
      Emitter<InspectionPlaceState> emit) async {
    emit(state.copyWith(getRegionsStatus: FormzStatus.submissionInProgress));
    final result = await getRegions.call('');
    if (result.isRight) {
      emit(
        state.copyWith(
          getRegionsStatus: FormzStatus.submissionSuccess,
          regions: result.right.results,
        ),
      );
    } else {
      emit(state.copyWith(getRegionsStatus: FormzStatus.submissionFailure));
    }
  }
}
