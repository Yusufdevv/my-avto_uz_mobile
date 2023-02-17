import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ads/domain/usecases/get_announcement_list_usecase.dart';
import 'package:auto/features/common/entities/makes_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_car_model_event.dart';

part 'get_car_model_state.dart';

part 'get_car_model_bloc.freezed.dart';

class GetCarModelBloc extends Bloc<GetCarModelEvent, GetCarModelState> {
  final GetCarModelUseCase useCase;
  GetAnnouncementListUseCase getAnnouncementListUseCase =
      GetAnnouncementListUseCase();

  GetCarModelBloc({required this.useCase}) : super(GetCarModelState()) {
    on<_GetCarModel>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(event.getId, name: event.search);
      if (result.isRight) {
        emit(
          state.copyWith(
            model: result.right,
            status: FormzStatus.submissionSuccess,
            count: result.right.count,
            next: result.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetMakeId>((event, emit) => emit(state.copyWith(getId: event.id)));
    on<_SelectedModelItem>((event, emit) {
      emit(state.copyWith(
          selectedId: event.selectedId, selectedModel: event.model));
    });
    on<_ConfirmModel>((event, emit) {
      emit(state.copyWith(confirmId: state.selectedId));
    });
    on<_RevertModel>((event, emit) {
      emit(state.copyWith(selectedId: state.confirmId));
    });
    on<_GetAnnouncementList>((event, emit) async {
      if(event.makeId == -1 || event.modelId == -1) {
        return;
      }
      emit(state.copyWith(getAnnouncementStatus: FormzStatus.submissionInProgress));
      final result = await getAnnouncementListUseCase.call({
        'make': event.makeId == -1 ? null : event.makeId,
        'model': event.modelId == -1 ? null : event.modelId,
      });
      if (result.isRight) {
        emit(state.copyWith(announcementCount: result.right.count, getAnnouncementStatus: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(getAnnouncementStatus: FormzStatus.submissionInProgress));
      }
    });
  }
}
