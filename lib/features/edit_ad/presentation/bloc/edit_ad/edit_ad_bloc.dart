import 'dart:async';
import 'dart:developer';

import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/district_entity.dart';
import 'package:auto/features/ad/domain/entities/generation/generation.dart';
import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/engine_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/entities/types/modification_type.dart';
import 'package:auto/features/ad/domain/entities/years/years.dart';
import 'package:auto/features/ad/domain/usecases/contacts_usecase.dart';
import 'package:auto/features/ad/domain/usecases/create_announcement.dart';
import 'package:auto/features/ad/domain/usecases/get_body_type.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ad/domain/usecases/get_drive_type.dart';
import 'package:auto/features/ad/domain/usecases/get_engine_type.dart';
import 'package:auto/features/ad/domain/usecases/get_generation.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/domain/usecases/get_map_screenshot_usecase.dart';
import 'package:auto/features/ad/domain/usecases/get_modification_type.dart';
import 'package:auto/features/ad/domain/usecases/get_years.dart';
import 'package:auto/features/ad/domain/usecases/minimum_price_usecase.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/domain/entity/car_generation_entity.dart';
import 'package:auto/features/common/domain/model/user.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/common/usecases/get_districts_usecase.dart';
import 'package:auto/features/common/usecases/get_regions_usecase.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/rent/domain/usecases/get_gearboxess_usecase.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';

part 'edit_ad_event.dart';

part 'edit_ad_state.dart';

part 'singleton_of_edit_ad_bloc.dart';

class EditAdBloc extends Bloc<EditAdEvent, EditAdState> {
  final GetModificationTypeUseCase modificationUseCase =
      GetModificationTypeUseCase();
  final GetMapScreenShotUseCase screenShotUseCase =
      GetMapScreenShotUseCase(repository: serviceLocator<AdRepositoryImpl>());
  final GetYearsUseCase getYearsUseCase =
      GetYearsUseCase(repository: serviceLocator<AdRepositoryImpl>());
  final CreateAnnouncementUseCase createUseCase =
      CreateAnnouncementUseCase(repository: serviceLocator<AdRepositoryImpl>());
  final AuthRepository userRepository = AuthRepository();
  final VerifyCodeUseCase verifyCodeUseCase = VerifyCodeUseCase();
  final ContactsUseCase contactsUseCase =
      ContactsUseCase(repository: serviceLocator<AdRepositoryImpl>());
  final GetMinimumPriceUseCase minimumPriceUseCase =
      GetMinimumPriceUseCase(repository: serviceLocator<AdRepositoryImpl>());
  final GetCarSingleUseCase announcementUseCase = GetCarSingleUseCase(
      repository: serviceLocator<CarSingleRepositoryImpl>());
  final GetRegionsUseCase regionsUseCase = GetRegionsUseCase();
  final GetDistrictsUseCase districtUseCase = GetDistrictsUseCase();
  final GetGearBoxessUseCase gearboxUseCase =
      GetGearBoxessUseCase(repository: serviceLocator<AdRepositoryImpl>());
  final GetDriveTypeUseCase driveTypeUseCase =
      GetDriveTypeUseCase(repository: serviceLocator<AdRepositoryImpl>());
  final GetEngineTypeUseCase engineUseCase =
      GetEngineTypeUseCase(repository: serviceLocator<AdRepositoryImpl>());
  final GetCarModelUseCase modelsUseCase =
      GetCarModelUseCase(repository: serviceLocator<AdRepositoryImpl>());
  final GetGenerationUseCase generationUseCase =
      GetGenerationUseCase(repository: serviceLocator<AdRepositoryImpl>());
  final GetMakesUseCase makeUseCase =
      GetMakesUseCase(repository: serviceLocator<AdRepositoryImpl>());
  final GetTopBrandUseCase topMakesUseCase = GetTopBrandUseCase();
  final GetBodyTypeUseCase bodyTypesUseCase =
      GetBodyTypeUseCase(repository: serviceLocator<AdRepositoryImpl>());

  EditAdBloc()
      : super(EditAdState(
          getAnnouncementToEditStatus: FormzStatus.pure,
          popStatus: PopStatus.success,
          colorName: LocaleKeys.white.tr(),
          status: FormzStatus.pure,
          phoneController: TextEditingController(),
          emailController: TextEditingController(),
          nameController: TextEditingController(),
        )) {
    on<EditAdChooseEvent>(_choose);
    on<EditAdChangeAppBarShadowEvent>(_changeAppBarShadow);
    // CREATE
    on<EditAdCreateEvent>(_create);
    on<EditAdDamageEvent>(_damage);
    on<EditAdGetRegionsEvent>(_getRegions);
    on<EditAdGetDistritsEvent>(_getDistricts);
    on<EditAdGetAnnouncementEvent>(_getAnnouncement);
    on<EditAdGetMinimumPriceEvent>(_getMinimumPrice);
    on<EditAdSendCodeEvent>(_sendCode);
    on<EditAdGetUserDataEvent>(_getUser);
    on<EditAdClearControllersEvent>(_clearControllers);
    on<EditAdGetMapScreenShotEvent>(_screenShot);
    on<EditAdAddEventForEveryPage>(_addEvent);
    on<EditAdClearStateEvent>(_clearState);
    on<EditAdShowToastEvent>(_showToast);
    on<EditAdOnRentWithPurchaseEvent>(_onRentWithPurchaseConditionChanged);
  }
  FutureOr<void> _onRentWithPurchaseConditionChanged(
      EditAdOnRentWithPurchaseEvent event, Emitter<EditAdState> emit) {
    final conditions = state.rentWithPurchaseConditions.map(MapEntry.new);
    conditions[event.condition.id] = event.condition;
    emit(state.copyWith(rentWithPurchaseConditions: conditions));
  }

  FutureOr<void> _showToast(
      EditAdShowToastEvent event, Emitter<EditAdState> emit) {
    emit(state.copyWith(toastMessage: event.message, popStatus: event.status));
  }

  FutureOr<void> _clearState(
      EditAdClearStateEvent event, Emitter<EditAdState> emit) {
    emit(
      EditAdState(
        getAnnouncementToEditStatus: FormzStatus.pure,
        popStatus: PopStatus.success,
        status: FormzStatus.pure,
        phoneController: TextEditingController(),
        emailController: TextEditingController(),
        nameController: TextEditingController(),
      ),
    );
  }

  FutureOr<void> _addEvent(
      EditAdAddEventForEveryPage event, Emitter<EditAdState> emit) {
    switch (event.page) {
      case 6:
        if (state.regions.isEmpty) add(EditAdGetRegionsEvent());
        break;
      case 7:
        add(EditAdGetMinimumPriceEvent());
        break;
    }
  }

  FutureOr<void> _screenShot(
      EditAdGetMapScreenShotEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(
        showExactAddress: true,
        status: FormzStatus.submissionInProgress,
        locationUrl:
            'https://yandex.com/maps/10335/tashkent/?ll=${event.long}%2C${event.lat}&z=${event.zoomLevel}'));
    final result = await screenShotUseCase
        .call({'longitude': '${event.long}', 'latitude': '${event.lat}'});

    if (result.isRight) {
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, mapPointBytes: result.right));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _clearControllers(
      EditAdClearControllersEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(
      phoneController: TextEditingController(),
      emailController: TextEditingController(),
      nameController: TextEditingController(),
    ));
  }

  FutureOr<void> _getUser(
      EditAdGetUserDataEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    if (state.userModel != null) {
      emit(EASingleton.initUserFromState(state));
      return;
    }
    final result = await userRepository.getUser();
    if (result.isRight) {
      emit(EASingleton.initUserFromApi(result.right, state));
    } else {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          toastMessage: MyFunctions.getErrorMessage(result.left),
          popStatus: PopStatus.error,
        ),
      );
    }
  }

  FutureOr<void> _sendCode(
      EditAdSendCodeEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final result =
        await contactsUseCase.call('+998${event.phone.replaceAll(' ', '')}');
    if (result.isRight) {
      event.onSuccess(result.right);
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, session: result.right));
    } else {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        toastMessage: MyFunctions.getErrorMessage(result.left),
        popStatus: PopStatus.error,
      ));
    }
  }

  FutureOr<void> _getMinimumPrice(
      EditAdGetMinimumPriceEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result =
        await minimumPriceUseCase.call(EASingleton.getMiniPrice(state));

    if (result.isRight) {
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, minimumPrice: result.right));
    } else {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, minimumPrice: 0));
    }
  }

  FutureOr<void> _getAnnouncement(
      EditAdGetAnnouncementEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(
        getAnnouncementToEditStatus: FormzStatus.submissionInProgress));
    final result = await announcementUseCase.call(event.id);
    if (result.isRight) {
      final stateForEdit = await EASingleton.stateForEdit(result.right);
      emit(stateForEdit);
    } else {
      emit(state.copyWith(
        getAnnouncementToEditStatus: FormzStatus.submissionFailure,
        toastMessage: MyFunctions.getErrorMessage(result.left),
        popStatus: PopStatus.error,
      ));
    }
  }

  FutureOr<void> _getDistricts(
      EditAdGetDistritsEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(getDistrictsStatus: FormzStatus.submissionInProgress));
    final result = await districtUseCase.call(event.regionId);
    if (result.isRight) {
      emit(
        state.copyWith(
          getDistrictsStatus: FormzStatus.submissionSuccess,
          districts: result.right.results,
        ),
      );
    } else {
      emit(state.copyWith(
        getDistrictsStatus: FormzStatus.submissionFailure,
        toastMessage: MyFunctions.getErrorMessage(result.left),
        popStatus: PopStatus.error,
      ));
    }
  }

  FutureOr<void> _getRegions(
      EditAdGetRegionsEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await regionsUseCase.call(NoParams());
    if (result.isRight) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          regions: result.right,
          districts: <DistrictEntity>[],
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        toastMessage: MyFunctions.getErrorMessage(result.left),
        popStatus: PopStatus.error,
      ));
    }
  }

  FutureOr<void> _damage(EditAdDamageEvent event, Emitter<EditAdState> emit) {
    final damages = state.damagedParts.map(MapEntry.new);
    damages[event.part] = event.type;
    emit(state.copyWith(damagedParts: damages));
  }

  FutureOr<void> _create(
      EditAdCreateEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(createStatus: FormzStatus.submissionInProgress));
    final result = await createUseCase.call(await EASingleton.create(state));
    if (result.isRight) {
      emit(
        state.copyWith(
          createStatus: FormzStatus.submissionSuccess,
          toastMessage: 'Your ad created successfully!',
          popStatus: PopStatus.success,
        ),
      );
    } else {
      emit(state.copyWith(
        createStatus: FormzStatus.submissionFailure,
        toastMessage: MyFunctions.getErrorMessage(result.left),
        popStatus: PopStatus.error,
      ));
    }
  }

  void _changeAppBarShadow(
      EditAdChangeAppBarShadowEvent event, Emitter<EditAdState> emit) {
    emit(state.copyWith(hasAppBarShadow: event.value));
  }

  void _choose(EditAdChooseEvent event, Emitter<EditAdState> emit) {
    if (event.regionId != null) {
      add(EditAdGetDistritsEvent(regionId: event.regionId!));
    }
    if (event.currency != null) {
      add(EditAdGetMinimumPriceEvent());
    }
    emit(EASingleton.choose(state, event));
  }
}
