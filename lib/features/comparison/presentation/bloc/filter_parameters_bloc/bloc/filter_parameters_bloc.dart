import 'package:auto/features/ad/data/models/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_parameters_event.dart';
part 'filter_parameters_state.dart';
part 'filter_parameters_bloc.freezed.dart';

class FilterParametersBloc
    extends Bloc<FilterParametersEvent, FilterParametersState> {
  FilterParametersBloc() : super(FilterParametersState()) {
    on<_GetIdVal>((event, emit) {
      emit(state.copyWith(idVal: event.id));
    });
    on<_GetBodyType>((event, emit) => emit(state.copyWith(bodyTypeEntity: event.entity)));
    on<_GetDriveType>((event, emit) => emit(state.copyWith(driveTypeEntity: event.entity)));
    on<_GetGearboxType>((event, emit) => emit(state.copyWith(gearboxTypeEntity: event.entity)));
  }
}
