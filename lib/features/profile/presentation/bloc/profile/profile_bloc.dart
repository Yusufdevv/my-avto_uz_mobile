import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/profile/data/models/profile.dart';
import 'package:auto/features/profile/domain/entities/profile.dart';
import 'package:auto/features/profile/domain/usecases/profile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
part 'profile_event.dart';
part 'profile_state.dart';
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileBloc({required this.profileUseCase})
      : super(ProfileState(
            status: FormzStatus.pure, profileEntity: ProfileModel.fromJson(const {}))) {
    on<GetProfileEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await profileUseCase.call(NoParams());
      if (result.isRight) {
        state.copyWith(status: FormzStatus.submissionSuccess, profileEntity: result.right);
      } else {
        state.copyWith(status: FormzStatus.submissionFailure);
      }
    });
  }
}
