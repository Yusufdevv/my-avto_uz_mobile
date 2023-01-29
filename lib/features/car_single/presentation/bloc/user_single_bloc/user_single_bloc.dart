import 'package:auto/features/car_single/domain/usecases/get_user_ads_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/get_user_single_usecase.dart';
import 'package:auto/features/dealers/domain/entities/cars_in_dealer_entity.dart';
import 'package:auto/features/dealers/domain/entities/dealer_info_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_single_bloc.freezed.dart';
part 'user_single_event.dart';
part 'user_single_state.dart';

class UserSingleBloc extends Bloc<UserSingleEvent, UserSingleState> {
  final GetUserSingleUseCase userSingleUseCase = GetUserSingleUseCase();
  final GetUserAdsUseCase userAdsUseCase = GetUserAdsUseCase();

 UserSingleBloc( )
      : super(UserSingleState()) {
    on<_GetUserSingle>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await userSingleUseCase.call(event.slug);
      if (result.isRight) {
        emit(
          state.copyWith(
              status: FormzStatus.submissionSuccess, dealerSingleEntity: result.right),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetUserAds>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await userAdsUseCase.call(event.slug);
      if (result.isRight) {
        emit(
          state.copyWith(
              status: FormzStatus.submissionSuccess, cars: result.right.results),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
