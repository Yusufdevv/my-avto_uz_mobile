import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/usecases/get_regions_usecase.dart';
import 'package:auto/features/rent/data/models/region_model.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'regions_event.dart';

part 'regions_state.dart';

part 'regions_bloc.freezed.dart';

class RegionsBloc extends Bloc<RegionsEvent, RegionsState> {
  final GetRegionsUseCase getRegionsUseCase = GetRegionsUseCase();

  RegionsBloc() : super(RegionsState()) {
    on<_GetRegions>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getRegionsUseCase.call(NoParams());

      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, regions: result.right));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
