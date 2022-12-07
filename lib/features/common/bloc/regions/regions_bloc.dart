import 'dart:async';

import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/usecases/get_regions.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'regions_event.dart';

part 'regions_state.dart';

part 'regions_bloc.freezed.dart';

class RegionsBloc extends Bloc<RegionsEvent, RegionsState> {
  final GetRegionsUseCase getRegions;

  RegionsBloc(this.getRegions) : super(RegionsState()) {
    on<_GetRegions>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getRegions('');

      if (result.isRight) {
        print('isRight141');
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            regions: result.right.results));
      } else {
        print('isLeft142');
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
