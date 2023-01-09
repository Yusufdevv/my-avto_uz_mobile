import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/data/models/announcement_filter.dart';
import 'package:auto/features/ad/data/models/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/common/usecases/announcement_list_usecase.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_list_event.dart';
part 'announcement_list_state.dart';
part 'announcement_list_bloc.freezed.dart';

class AnnouncementListBloc
    extends Bloc<AnnouncementListEvent, AnnouncementListState> {
  AnnouncementListUseCase useCase;
  AnnouncementListBloc({required this.useCase})
      : super(AnnouncementListState()) {
    on<_GetAnnouncementList>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(state.filter);
      if (result.isRight) {
        emit(
          state.copyWith(
            announcementList: result.right.results,
            status: FormzStatus.submissionSuccess,
            count: result.right.count,
            next: result.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetFilter>(
      (event, emit) => emit(state.copyWith(filter: event.filter)),
    );
        on<_GetIdVal>((event, emit) {
      emit(state.copyWith(idVal: event.id));
    });
    on<_GetBodyType>((event, emit) => emit(state.copyWith(bodyTypeEntity: event.entity)));
    on<_GetDriveType>((event, emit) => emit(state.copyWith(driveTypeEntity: event.entity)));
    on<_GetGearboxType>((event, emit) => emit(state.copyWith(gearboxTypeEntity: event.entity)));
  }
}
