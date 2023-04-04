import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/usecases/call_count_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/other_ads_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/sold_ads_usecase.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_single_bloc.freezed.dart';

part 'car_single_event.dart';

part 'car_single_state.dart';

class CarSingleBloc extends Bloc<CarSingleEvent, CarSingleState> {
  final GetCarSingleUseCase useCaseSingle;
  final OtherAdsUseCase useCaseAds;
  final SoldAdsUseCase soldAdsUseCase;
  final CallCount callCount;

  CarSingleBloc(
      this.useCaseSingle, this.useCaseAds, this.soldAdsUseCase, this.callCount)
      : super(const CarSingleState()) {
    ///
    on<_GetSingle>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCaseSingle.call(event.id);
      if (result.isRight) {
        add(_GetAds('${result.right.make.name} ${result.right.model.name}'));
        emit(state.copyWith(
          singleEntity: result.right,
          status: FormzStatus.submissionSuccess,
        ));
      } else {}
    });

    ///
    on<_GetAds>((event, emit) async {
      emit(state.copyWith(adsStatus: FormzStatus.submissionInProgress));
      final result = await useCaseAds.call({'search': event.makeModel});
      if (result.isRight) {
        emit(state.copyWith(
            elasticSearchEntity: result.right.results,
            adsStatus: FormzStatus.submissionSuccess,
            fetchMore: result.right.next != null));
      } else {}
    });

    ///
    on<_GetMoreAds>((event, emit) async {
      final result = await useCaseAds.call({
        'search': event.makeModel,
        'offset': state.elasticSearchEntity.length
      });
      if (result.isRight) {
        emit(state.copyWith(elasticSearchEntity: [
          ...state.elasticSearchEntity,
          ...result.right.results
        ], fetchMore: result.right.next != null));
      }
    });

    ///
    on<_SoldAds>((event, emit) async {
      final result = await soldAdsUseCase.call(event.id);
      emit(state.copyWith(soldStatus: FormzStatus.submissionInProgress));
      if (result.isRight) {
        event.onSucc('LocaleKeys.your_ad_closed_successfully.tr()');
        emit(state.copyWith(
            soldStatus: FormzStatus.submissionSuccess, succMessage: 'succes'));
      } else {
        event.onError((result.left as ServerFailure).errorMessage);
        emit(state.copyWith(
            soldStatus: FormzStatus.submissionFailure,
            errorMessage: (result.left as ServerFailure).errorMessage));
      }
    });

    ///
    on<_CallCount>((event, emit) async {
      final result = await callCount.call(event.id);
      emit(state.copyWith(soldStatus: FormzStatus.submissionInProgress));
      if (result.isRight) {
        emit(state.copyWith(soldStatus: FormzStatus.submissionSuccess));
      }
    });
  }
}
