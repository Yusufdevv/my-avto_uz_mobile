import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:auto/features/rent/domain/entities/search_param_entity.dart';
import 'package:auto/features/rent/domain/usecases/rent_usecase.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'rent_event.dart';
part 'rent_state.dart';

class RentBloc extends Bloc<RentEvent, RentState> {
  final RentUseCase rentUseCase;
  final int id;

  RentBloc(this.rentUseCase, this.id)
      : super(RentState(
          searchParams: searchParams,
          categoryId: 5,
          count: 5,
          hasAirConditioners: 0,
          hasBabySeat: 0,
          list: const [],
          next: '',
          paginationStatus: FormzStatus.pure,
          rentCarIsClean: 0,
          rentCarIsFullFuel: 0,
          status: FormzStatus.pure,
        )) {
    on<RentChangeSearchParamEvent>((event, emit) async {
      final v = state.searchParams[event.paramKey]!.changeSelected();
      state.searchParams[event.paramKey] = v;
      final vv = state.searchParams;
      emit(state.copyWith(searchParams: vv, categoryId: 3));
    });
    on<RentGetResultsEvent>((event, emit) async {
      if (!event.isRefresh) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
      }
      final result = await rentUseCase(Param(
        next: '',
        id: id,
        hasAirConditioner: state.hasAirConditioners,
        hasBabySeat: state.hasBabySeat,
        rentCarIsClean: state.rentCarIsClean,
        rentCarIsFullFuel: state.rentCarIsFullFuel,
      ));
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            list: result.right.results,
            count: result.right.count,
            next: result.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<RentGetMoreEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await rentUseCase(Param(next: state.next!, id: id));
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            list: [...state.list, ...result.right.results],
            count: result.right.count,
            next: result.right.next));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<RentSetIdEvent>((event, emit) async {
      emit(state.copyWith(
        categoryId: id,
        hasBabySeat: event.hasBabySeat ?? state.hasBabySeat,
        hasAirConditioners: event.hasAirConditioner ?? state.hasAirConditioners,
        rentCarIsFullFuel: event.rentCarIsFullFuel ?? state.rentCarIsFullFuel,
        rentCarIsClean: event.rentCarIsClean ?? state.rentCarIsClean,
      ));
      add(RentGetResultsEvent(isRefresh: true));
    });
  }

  static Map<ParamKey, SearchParam> searchParams = {
    ParamKey.airConditioner: SearchParam(
      apiKey: 'rent_car__has_air_conditioner',
      icon: AppIcons.wind,
      isSelected: false,
      title: LocaleKeys.conditioner.tr(),
    ),
    ParamKey.babyChair: SearchParam(
      apiKey: 'rent_car__has_baby_seat',
      icon: AppIcons.child,
      isSelected: false,
      title: LocaleKeys.baby_chair.tr(),
    ),
    ParamKey.fullTank: SearchParam(
      apiKey: 'rent_car__is_full_fuel',
      icon: AppIcons.gas,
      isSelected: false,
      title: LocaleKeys.full_tank.tr(),
    ),
    ParamKey.cleneCar: SearchParam(
      apiKey: 'rent_car__is_clean',
      icon: AppIcons.carIcon,
      isSelected: false,
      title: 'Чистая машина',
    )
  };
}
