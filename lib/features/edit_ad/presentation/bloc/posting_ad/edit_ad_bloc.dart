import 'dart:async';

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
            searchController: TextEditingController())) {
    on<EditAdChooseEvent>(_choose);
    on<EditAdMakesEvent>(_makes);
    on<EditAdTopMakesEvent>(_topMakes);
    on<EditAdChangeAppBarShadowEvent>(_changeAppBarShadow);
    on<EditAdGenerationsEvent>(_generations);
    on<EditAdModelEvent>(_models);
    on<EditAdEnginesEvent>(_engines);
    on<EditAdDriveTypesEvent>(_driveTypes);
    on<EditAdGearBoxesEvent>(_gearBoxes);
    on<EditAdBodyTypesEvent>(_bodyTypes);
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
    on<EditAdGetYearsEvent>(_getYears);
    on<EditAdGetMapScreenShotEvent>(_screenShot);
    on<EditAdAddEventForEveryPage>(_addEvent);
    on<EditAdSearchMakesEvent>(_searchMake);
    on<EditAdModificationsEvent>(_modification);
    on<EditAdClearStateEvent>(_clearState);
    on<EditAdSerchControllerClearEvent>(_clearSearchController);
    on<EditAdShowToastEvent>(_showToast);
  }

  FutureOr<void> _showToast(
      EditAdShowToastEvent event, Emitter<EditAdState> emit) {
    emit(state.copyWith(toastMessage: event.message, popStatus: event.status));
  }

  FutureOr<void> _clearSearchController(
      EditAdSerchControllerClearEvent event, Emitter<EditAdState> emit) {
    add(EditAdMakesEvent());
    emit(state.copyWith(searchController: TextEditingController()));
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
        searchController: TextEditingController(),
        makes: state.makes,
      ),
    );
    add(EditAdMakesEvent());
  }

  FutureOr<void> _modification(
      EditAdModificationsEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await modificationUseCase.call(ModificationTypeParams(
        bodyTypeId: state.bodyType!.id,
        driveTypeId: state.driveTypeId!,
        engineTypeId: state.engineId!,
        gearBoxTypeTypeId: state.gearbox!.id,
        generationId: state.generationId!,
        next: ''));
    if (result.isRight) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          modifications: result.right.results,
          modification: result.right.results.isNotEmpty
              ? result.right.results.first
              : null,
        ),
      );
    } else {
      emit(
        state.copyWith(
            status: FormzStatus.submissionFailure,
            toastMessage: MyFunctions.getErrorMessage(result.left)),
      );
    }
  }

  FutureOr<void> _searchMake(
      EditAdSearchMakesEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(getMakesStatus: FormzStatus.submissionInProgress));
    final result = await makeUseCase.call(event.name);
    if (result.isRight) {
      emit(state.copyWith(
          getMakesStatus: FormzStatus.submissionSuccess,
          makes: result.right.results));
    } else {
      emit(state.copyWith(
          getMakesStatus: FormzStatus.submissionFailure,
          toastMessage: MyFunctions.getErrorMessage(result.left)));
    }
  }

  FutureOr<void> _addEvent(
      EditAdAddEventForEveryPage event, Emitter<EditAdState> emit) {
    switch (event.page) {
      case 0:
        if (state.makes.isEmpty) add(EditAdMakesEvent());
        break;
      case 1:
        add(EditAdModelEvent());
        break;
      case 2:
        add(EditAdGetYearsEvent());
        break;
      case 3:
        add(EditAdGenerationsEvent(modelId: state.model!.id));
        break;
      case 4:
        add(EditAdBodyTypesEvent());
        break;
      case 5:
        add(EditAdEnginesEvent());
        break;
      case 6:
        add(EditAdDriveTypesEvent());
        break;
      case 7:
        add(EditAdGearBoxesEvent());
        break;
      case 8:
        add(EditAdModificationsEvent());
        break;
      case 16:
        if (state.regions.isEmpty) add(EditAdGetRegionsEvent());
        break;
      case 17:
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

  FutureOr<void> _getYears(
      EditAdGetYearsEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result =
        await getYearsUseCase.call(YearsParams(modelId: state.model!.id));
    if (result.isRight) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          years: result.right.results,
          yearEntity: result.right.results.isNotEmpty
              ? result.right.results.first
              : null,
        ),
      );
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
            toastMessage: MyFunctions.getErrorMessage(result.left)),
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
          toastMessage: MyFunctions.getErrorMessage(result.left)));
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
          toastMessage: MyFunctions.getErrorMessage(result.left)));
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
          toastMessage: MyFunctions.getErrorMessage(result.left)));
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
          toastMessage: MyFunctions.getErrorMessage(result.left)));
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
      emit(state.copyWith(
          createStatus: FormzStatus.submissionSuccess,
          toastMessage: 'Your ad created successfully!'));
    } else {
      emit(state.copyWith(
          createStatus: FormzStatus.submissionFailure,
          toastMessage: MyFunctions.getErrorMessage(result.left)));
    }
  }

  FutureOr<void> _bodyTypes(
      EditAdBodyTypesEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await bodyTypesUseCase
        .call(BodyTypeParams(generationId: state.generationId!));

    if (result.isRight) {
      final bodies = result.right.results;
      emit(
        state.copyWith(
            status: FormzStatus.submissionSuccess,
            bodyTypes: result.right.results,
            bodyType: bodies.isNotEmpty ? bodies.first : null),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _gearBoxes(
      EditAdGearBoxesEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await gearboxUseCase.call(NoParams());
    if (result.isRight) {
      final gearBoxes = result.right.results;
      emit(
        state.copyWith(
            status: FormzStatus.submissionSuccess,
            gearBoxes: gearBoxes,
            gearbox: gearBoxes.isNotEmpty ? gearBoxes.first : null),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _driveTypes(
      EditAdDriveTypesEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await driveTypeUseCase.call(DriveTypeParams(
        generationId: state.generationId!,
        bodyTypeId: state.bodyType!.id,
        engineTypeId: state.engineId!));
    if (result.isRight) {
      final driveTypes = result.right.results;
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          driveTypes: driveTypes,
          driveTypeId: driveTypes.isNotEmpty ? driveTypes.first.id : null,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _engines(
      EditAdEnginesEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await engineUseCase.call(EngineTypeParams(
      bodyTypeId: state.bodyType!.id,
      generationId: state.generationId!,
    ));

    if (result.isRight) {
      final engines = result.right.results;
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          engines: engines,
          engineId: engines.isNotEmpty ? engines.first.id : null,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _models(
      EditAdModelEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await modelsUseCase.call(state.make!.id, name: event.name);
    if (result.isRight) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          models: result.right.results,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _generations(
      EditAdGenerationsEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await generationUseCase.call(GenerationParams(
        modelId: state.model!.id, year: state.yearEntity!.yearBegin));
    if (result.isRight) {
      final generations = result.right.results;
      emit(state.copyWith(
          generations: generations,
          status: FormzStatus.submissionSuccess,
          generationId: generations.isNotEmpty ? generations.first.id : null));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _topMakes(
      EditAdTopMakesEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final result = await topMakesUseCase.call(event.name);
    if (result.isRight) {
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
        topMakes: result.right.results,
      ));
    } else {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }

  FutureOr<void> _makes(
      EditAdMakesEvent event, Emitter<EditAdState> emit) async {
    emit(state.copyWith(getMakesStatus: FormzStatus.submissionInProgress));

    final result = await makeUseCase.call(null);
    if (result.isRight) {
      emit(
        state.copyWith(
          getMakesStatus: FormzStatus.submissionSuccess,
          makes: result.right.results,
        ),
      );
    } else {
      emit(
        state.copyWith(
          getMakesStatus: FormzStatus.submissionFailure,
        ),
      );
    }
    add(EditAdTopMakesEvent());
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
