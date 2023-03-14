import 'package:auto/features/car_single/data/model/create_owner.dart';
import 'package:auto/features/car_single/domain/usecases/verify_owner_create.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'create_owner_event.dart';

part 'create_owner_state.dart';

class CreateOwnerBloc extends Bloc<CreateOwnerEvent, CreateOwnerState> {
  final VerifyOwnerCreateUseCase verifyOwnerCreateUseCase;

  CreateOwnerBloc({required this.verifyOwnerCreateUseCase})
      : super(CreateOwnerState(
          status: FormzStatus.pure,
          createOwnerModel: CreateOwnerModel.fromJson(const {}),
        )) {
    on<VerifyOwnerCreateEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result =
          await verifyOwnerCreateUseCase.call(event.createOwnerModel);
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            createOwnerModel: result.right));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
