import 'package:auto/features/car_single/domain/entities/user_single_entity.dart';
import 'package:auto/features/car_single/domain/usecases/get_user_ads_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/get_user_single_usecase.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_single_bloc.freezed.dart';
part 'user_single_event.dart';
part 'user_single_state.dart';

class UserSingleBloc extends Bloc<UserSingleEvent, UserSingleState> {
  final GetUserSingleUseCase userSingleUseCase = GetUserSingleUseCase();
  final GetUserAdsUseCase userAdsUseCase = GetUserAdsUseCase();

  UserSingleBloc() : super(UserSingleState()) {
    //
    on<_GetUserSingle>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await userSingleUseCase
          .call(Params(event.userId, event.announcementId));
      if (result.isRight) {
        emit(
          state.copyWith(
              status: FormzStatus.submissionSuccess,
              userSingleEntity: result.right),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    //
    on<_GetUserAds>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await userAdsUseCase.call(event.userId);
      if (result.isRight) {
        emit(
          state.copyWith(
              status: FormzStatus.submissionSuccess,
              userAds: result.right.results),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
