import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/rent/domain/usecases/get_drive_types_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'get_drive_types_event.dart';
part 'get_drive_types_state.dart';

class GetDriveTypesBloc extends Bloc<GetDriveTypesEvent, GetDriveTypesState> {
  final int selectedId;
  final GetDriveTypesUseCase getBodyTypeUseCase;
  GetDriveTypesBloc(
      {required this.selectedId, required this.getBodyTypeUseCase})
      : super(const GetDriveTypesState(
            status: FormzStatus.pure, driveTypes: [])) {
    on<GetDriveTypesSelectEvent>(
        (event, emit) => emit(state.copyWith(selected: event.index)));
    on<GetDriveTypesGetEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      print('result is getting');
      final result = await getBodyTypeUseCase.call(NoParams());
      print('result is got');
      if (result.isRight) {
        print('result is right in drivetype bloc');
        emit(
          state.copyWith(
            selected: result.right.results
                .indexWhere((element) => element.id == selectedId),
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
