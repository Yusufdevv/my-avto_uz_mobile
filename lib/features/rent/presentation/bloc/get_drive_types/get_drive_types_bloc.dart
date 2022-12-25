import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/rent/domain/usecases/get_drive_types_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'get_drive_types_event.dart';
part 'get_drive_types_state.dart';

class GetDriveTypesBloc extends Bloc<GetDriveTypesEvent, GetDriveTypesState> {
  final GetDriveTypesUseCase getBodyTypeUseCase;
  GetDriveTypesBloc({required this.getBodyTypeUseCase})
      : super(
            const GetDriveTypesState(status: FormzStatus.pure, driveTypes: [])) {
    on<GetDriveTypesEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getBodyTypeUseCase.call(NoParams());
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            driveTypes: result.right.results,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
