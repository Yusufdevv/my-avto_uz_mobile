import 'package:auto/features/car_single/data/model/create_owner.dart';
import 'package:auto/features/car_single/domain/usecases/verify_owner_create_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/delete_application_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'create_owner_event.dart';

part 'create_owner_state.dart';

class CreateOwnerBloc extends Bloc<CreateOwnerEvent, CreateOwnerState> {
  final VerifyOwnerCreateUseCase verifyOwnerCreateUseCase =
      VerifyOwnerCreateUseCase();
  final DeleteApplicationUseCase deleteApplicationUseCase =
      DeleteApplicationUseCase();

  CreateOwnerBloc()
      : super(CreateOwnerState(
          status: FormzStatus.pure,
          createOwnerModel: CreateOwnerModel.fromJson(
            const {},
          ),
        )) {
    ///
    on<VerifyOwnerCreateEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result =
          await verifyOwnerCreateUseCase.call(event.createOwnerModel);
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          createOwnerModel: result.right,
          showModerationBtn: true,
          showMoreBtn: true,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<DeleteApplicaitionEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await deleteApplicationUseCase.call(event.id);
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          showModerationBtn: false,
          showMoreBtn: false,
          refresh: true,
          isDeleted: true,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<ChangeUIStatusEvent>((event, emit) {
      emit(state.copyWith(
          showModerationBtn: !event.refresh, refresh: event.refresh));
    });

    on<ReApplicationEvent>((event, emit) {
      emit(state.copyWith(refresh: !event.refresh, isDeleted: !event.refresh));
    });


  }
}
