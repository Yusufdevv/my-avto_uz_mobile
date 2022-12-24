import 'package:auto/features/car_single/data/model/damaged_parts_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_manipulation_event.dart';
part 'ad_manipulation_state.dart';
part 'ad_manipulation_bloc.freezed.dart';

class AdManipulationBloc
    extends Bloc<AdManipulationEvent, AdManipulationState> {
  AdManipulationBloc() : super(AdManipulationState()) {
    on<_SetBodyType>((event, emit) {
      emit(state.copyWith(bodyType: event.bodyTypeId));
    });
  }
}
