import 'dart:async';
import 'dart:developer';

import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/district_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_options_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_options_list_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/gas_equipment_entity.dart';
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
import 'package:auto/features/ad/domain/usecases/get_equipment_options.dart';
import 'package:auto/features/ad/domain/usecases/get_equipment_options_list.dart';
import 'package:auto/features/ad/domain/usecases/get_equipments.dart';
import 'package:auto/features/ad/domain/usecases/get_gas_equipment.dart';
import 'package:auto/features/ad/domain/usecases/get_generation.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/domain/usecases/get_map_screenshot_usecase.dart';
import 'package:auto/features/ad/domain/usecases/get_modification_type.dart';
import 'package:auto/features/ad/domain/usecases/get_years.dart';
import 'package:auto/features/ad/domain/usecases/minimum_price_usecase.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/domain/model/user.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/common/usecases/get_districts_usecase.dart';
import 'package:auto/features/common/usecases/get_regions_usecase.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
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

part 'posting_ad_event.dart';

part 'posting_ad_state.dart';

part 'singleton_of_posting_ad_bloc.dart';

class PostingAdBloc extends Bloc<PostingAdEvent, PostingAdState> {
  final GetModificationTypeUseCase modificationUseCase =
      GetModificationTypeUseCase();
  final GetMapScreenShotUseCase screenShotUseCase = GetMapScreenShotUseCase();
  final GetYearsUseCase getYearsUseCase = GetYearsUseCase();
  final CreateAnnouncementUseCase createUseCase = CreateAnnouncementUseCase();
  final AuthRepository userRepository = AuthRepository();
  final VerifyCodeUseCase verifyCodeUseCase = VerifyCodeUseCase();
  final ContactsUseCase contactsUseCase = ContactsUseCase();
  final GetMinimumPriceUseCase minimumPriceUseCase = GetMinimumPriceUseCase();
  final GetCarSingleUseCase announcementUseCase = GetCarSingleUseCase();
  final GetRegionsUseCase regionsUseCase = GetRegionsUseCase();
  final GetDistrictsUseCase districtUseCase = GetDistrictsUseCase();
  final GetGearBoxessUseCase gearboxUseCase = GetGearBoxessUseCase();
  final GetDriveTypeUseCase driveTypeUseCase = GetDriveTypeUseCase();
  final GetEngineTypeUseCase engineUseCase = GetEngineTypeUseCase();
  final GetCarModelUseCase modelsUseCase = GetCarModelUseCase();
  final GetGenerationUseCase generationUseCase = GetGenerationUseCase();
  final GetMakesUseCase makeUseCase = GetMakesUseCase();
  final GetTopBrandUseCase topMakesUseCase = GetTopBrandUseCase();
  final GetBodyTypeUseCase bodyTypesUseCase = GetBodyTypeUseCase();
  final GetGasEquipmentsUseCase gasEquipmentsUseCase =
      GetGasEquipmentsUseCase();
  final GetEquipmentsUseCase getEquipmentsUseCase = GetEquipmentsUseCase();
  final GetEquipmentOptionsListUseCase getEquipmentOptionsListUseCase =
      GetEquipmentOptionsListUseCase();
  final GetEquipmentOptionsUseCase getEquipmentOptionsUseCase =
      GetEquipmentOptionsUseCase();

  PostingAdBloc()
      : super(PostingAdState(
            contactsFormKey: GlobalKey<FormState>(),
            popStatus: PopStatus.success,
            colorName: LocaleKeys.white.tr(),
            status: FormzStatus.pure,
            phoneController: TextEditingController(),
            emailController: TextEditingController(),
            nameController: TextEditingController(),
            searchController: TextEditingController())) {
    on<PostingAdChooseEvent>(_choose);
    on<PostingAdMakesEvent>(_makes);
    on<PostingAdTopMakesEvent>(_topMakes);
    on<PostingAdChangeAppBarShadowEvent>(_changeAppBarShadow);
    on<PostingAdGenerationsEvent>(_generations);
    on<PostingAdModelEvent>(_models);
    on<PostingAdEnginesEvent>(_engines);
    on<PostingAdDriveTypesEvent>(_driveTypes);
    on<PostingAdGearBoxesEvent>(_gearBoxes);
    on<PostingAdBodyTypesEvent>(_bodyTypes);
    // CREATE
    on<PostingAdCreateEvent>(_create);
    on<PostingAdDamageEvent>(_damage);
    on<PostingAdGetRegionsEvent>(_getRegions);
    on<PostingAdGetDistritsEvent>(_getDistricts);
    on<PostingAdGetMinimumPriceEvent>(_getMinimumPrice);
    on<PostingAdSendCodeEvent>(_sendCode);
    on<PostingAdGetUserDataEvent>(_getUser);
    on<PostingAdClearControllersEvent>(_clearControllers);
    on<PostingAdGetYearsEvent>(_getYears);
    on<PostingAdGetMapScreenShotEvent>(_screenShot);
    on<PostingAdAddEventForEveryPage>(_addEvent);
    on<PostingAdSearchMakesEvent>(_searchMake);
    on<PostingAdModificationsEvent>(_modification);
    on<PostingAdClearStateEvent>(_clearState);
    on<PostingAdSerchControllerClearEvent>(_clearSearchController);
    on<PostingAdShowToastEvent>(_showToast);
    on<PostingAdOnRentWithPurchaseConditionChangedEvent>(
        _onRentWithPurchaseCondition);
    on<PostingAdGetGasEquipments>(_getGasEquipments);
    on<PostingAdGetEquipments>(_getEquipments);
    on<PostingAdGetEquipmentOptionsList>(_getEquipmentOptionsList);
    on<PostingAdChangeOption>(_getChangeOption);
    on<PostingAdSelectEquipmentEvent>(_selectEquipment);
  }

  FutureOr<void> _selectEquipment(
      PostingAdSelectEquipmentEvent event, Emitter<PostingAdState> emit) async {
    if (event.equipment.id == -1) {
      emit(
        state.copyWith(
          isLastEquipmentIdToNull: true,
          isEquipmentToNull: true,
          selectOptions: {},
          radioOptions: {},
        ),
      );
    } else {
      emit(state.copyWith(
          equipment: event.equipment,
          selectOptions: makeSelectsSelected(v: event.equipment!.options),
          radioOptions: makeRadiosSelected(v: event.equipment!.options)));
    }
  }

  FutureOr<void> _onRentWithPurchaseCondition(
      PostingAdOnRentWithPurchaseConditionChangedEvent event,
      Emitter<PostingAdState> emit) {
    final map = state.rentWithPurchaseConditions.map(MapEntry.new);
    map[event.condition.id] = event.condition;
    emit(state.copyWith(rentWithPurchaseConditions: map));
  }

  FutureOr<void> _showToast(
      PostingAdShowToastEvent event, Emitter<PostingAdState> emit) {
    emit(state.copyWith(toastMessage: event.message, popStatus: event.status));
  }

  FutureOr<void> _clearSearchController(
      PostingAdSerchControllerClearEvent event, Emitter<PostingAdState> emit) {
    add(PostingAdMakesEvent());
    emit(state.copyWith(searchController: TextEditingController()));
  }

  FutureOr<void> _clearState(
      PostingAdClearStateEvent event, Emitter<PostingAdState> emit) {
    emit(
      PostingAdState(
        contactsFormKey: GlobalKey<FormState>(),
        popStatus: PopStatus.success,
        status: FormzStatus.submissionSuccess,
        phoneController: TextEditingController(),
        emailController: TextEditingController(),
        nameController: TextEditingController(),
        searchController: TextEditingController(),
        makes: state.makes,
      ),
    );
    add(PostingAdMakesEvent());
  }

  FutureOr<void> _modification(
      PostingAdModificationsEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(
        getModificationStatus: FormzStatus.submissionInProgress));
    final result = await modificationUseCase.call(ModificationTypeParams(
        bodyTypeId: state.bodyType?.id,
        driveTypeId: state.driveTypeId,
        engineTypeId: state.engineId,
        gearBoxTypeTypeId: state.gearbox?.id,
        generationId: state.generationId,
        next: ''));
    if (result.isRight) {
      emit(
        state.copyWith(
          getModificationStatus: FormzStatus.submissionSuccess,
          modifications: result.right.results,
          modification:
              result.right.results.isNotEmpty && state.modification == null
                  ? result.right.results.first
                  : null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          getModificationStatus: FormzStatus.submissionFailure,
          toastMessage: MyFunctions.getErrorMessage(result.left),
          popStatus: PopStatus.error,
        ),
      );
    }
  }

  FutureOr<void> _searchMake(
      PostingAdSearchMakesEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(getMakesStatus: FormzStatus.submissionInProgress));
    final result = await makeUseCase.call(event.name);
    if (result.isRight) {
      emit(state.copyWith(
          getMakesStatus: FormzStatus.submissionSuccess,
          makes: result.right.results));
    } else {
      emit(state.copyWith(
        getMakesStatus: FormzStatus.submissionFailure,
        toastMessage: MyFunctions.getErrorMessage(result.left),
        popStatus: PopStatus.error,
      ));
    }
  }

  FutureOr<void> _addEvent(
      PostingAdAddEventForEveryPage event, Emitter<PostingAdState> emit) {
    switch (event.page) {
      case 0:
        if (state.makes.isEmpty) add(PostingAdMakesEvent());
        break;
      case 1:
        add(PostingAdModelEvent());
        break;
      case 2:
        add(PostingAdGetYearsEvent());
        break;
      case 3:
        add(PostingAdGenerationsEvent(modelId: state.model!.id));
        break;
      case 4:
        add(PostingAdBodyTypesEvent());
        break;
      case 5:
        add(PostingAdEnginesEvent());
        add(PostingAdGetGasEquipments());
        break;
      case 6:
        add(PostingAdDriveTypesEvent());
        break;
      case 7:
        add(PostingAdGearBoxesEvent());
        break;
      case 8:
        add(PostingAdModificationsEvent());
        break;
      case 13:
        add(PostingAdGetEquipments());
        break;
      case 16:
        if (state.regions.isEmpty) add(PostingAdGetRegionsEvent());
        break;
      case 17:
        add(PostingAdGetMinimumPriceEvent());
        break;
    }
  }

  FutureOr<void> _screenShot(PostingAdGetMapScreenShotEvent event,
      Emitter<PostingAdState> emit) async {
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
      PostingAdGetYearsEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result =
        await getYearsUseCase.call(YearsParams(modelId: state.model!.id));
    if (result.isRight) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          years: result.right.results,
          yearEntity:
              result.right.results.isNotEmpty && state.yearEntity == null
                  ? result.right.results.first
                  : null,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _clearControllers(PostingAdClearControllersEvent event,
      Emitter<PostingAdState> emit) async {
    emit(state.copyWith(
      phoneController: TextEditingController(),
      emailController: TextEditingController(),
      nameController: TextEditingController(),
      contactsFormKey: GlobalKey<FormState>(),
    ));
  }

  FutureOr<void> _getUser(
      PostingAdGetUserDataEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    if (state.userModel != null) {
      emit(PASingleton.initUserFromState(state));
      return;
    }
    final result = await userRepository.getUser();
    if (result.isRight) {
      emit(PASingleton.initUserFromApi(result.right, state));
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
      PostingAdSendCodeEvent event, Emitter<PostingAdState> emit) async {
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
      PostingAdGetMinimumPriceEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result =
        await minimumPriceUseCase.call(PASingleton.getMiniPrice(state));

    if (result.isRight) {
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, minimumPrice: result.right));
    } else {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, minimumPrice: 0));
    }
  }

  FutureOr<void> _getDistricts(
      PostingAdGetDistritsEvent event, Emitter<PostingAdState> emit) async {
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
      PostingAdGetRegionsEvent event, Emitter<PostingAdState> emit) async {
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

  FutureOr<void> _damage(
      PostingAdDamageEvent event, Emitter<PostingAdState> emit) {
    final damages = state.damagedParts.map(MapEntry.new);
    damages[event.part] = event.type;
    emit(state.copyWith(damagedParts: damages));
  }

  FutureOr<void> _create(
      PostingAdCreateEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(createStatus: FormzStatus.submissionInProgress));
    final result = await createUseCase.call(await PASingleton.create(state));

    if (result.isRight) {
      emit(state.copyWith(
        createStatus: FormzStatus.submissionSuccess,
        toastMessage: 'Your ad created successfully!',
        popStatus: PopStatus.success,
      ));
    } else {
      emit(state.copyWith(
        createStatus: FormzStatus.submissionFailure,
        toastMessage: MyFunctions.getErrorMessage(result.left),
        popStatus: PopStatus.error,
      ));
    }
  }

  FutureOr<void> _bodyTypes(
      PostingAdBodyTypesEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await bodyTypesUseCase
        .call(BodyTypeParams(generationId: state.generationId));

    if (result.isRight) {
      final bodies = result.right.results;
      emit(
        state.copyWith(
            status: FormzStatus.submissionSuccess,
            bodyTypes: result.right.results,
            bodyType: bodies.isNotEmpty && state.bodyType == null
                ? bodies.first
                : null),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _gearBoxes(
      PostingAdGearBoxesEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await gearboxUseCase.call(NoParams());
    if (result.isRight) {
      final gearBoxes = result.right.results;
      emit(
        state.copyWith(
            status: FormzStatus.submissionSuccess,
            gearBoxes: gearBoxes,
            gearbox: gearBoxes.isNotEmpty && state.gearbox == null
                ? gearBoxes.first
                : null),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _driveTypes(
      PostingAdDriveTypesEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await driveTypeUseCase.call(DriveTypeParams(
      generationId: state.generationId,
      bodyTypeId: state.bodyType?.id,
      engineTypeId: state.engineId,
    ));
    if (result.isRight) {
      final driveTypes = result.right.results;
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          driveTypes: driveTypes,
          driveTypeId: driveTypes.isNotEmpty && state.driveTypeId == null
              ? driveTypes.first.id
              : null,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _engines(
      PostingAdEnginesEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await engineUseCase.call(EngineTypeParams(
      bodyTypeId: state.bodyType?.id,
      generationId: state.generationId,
    ));

    if (result.isRight) {
      final engines = result.right.results;
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          engines: engines,
          engineId: engines.isNotEmpty && state.engineId == null
              ? engines.first.id
              : null,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _models(
      PostingAdModelEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result =
        await modelsUseCase.call(state.make?.id ?? -1, name: event.name);
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
      PostingAdGenerationsEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await generationUseCase.call(GenerationParams(
      modelId: state.model?.id,
      year: state.yearEntity?.yearBegin,
    ));
    if (result.isRight) {
      final generations = result.right.results;
      emit(state.copyWith(
          generations: generations,
          status: FormzStatus.submissionSuccess,
          generationId: generations.isNotEmpty && state.generationId == null
              ? generations.first.id
              : null));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _topMakes(
      PostingAdTopMakesEvent event, Emitter<PostingAdState> emit) async {
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
      PostingAdMakesEvent event, Emitter<PostingAdState> emit) async {
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
    add(PostingAdTopMakesEvent());
  }

  void _changeAppBarShadow(
      PostingAdChangeAppBarShadowEvent event, Emitter<PostingAdState> emit) {
    emit(state.copyWith(hasAppBarShadow: event.value));
  }

  void _choose(PostingAdChooseEvent event, Emitter<PostingAdState> emit) {
    if (event.regionId != null) {
      add(PostingAdGetDistritsEvent(regionId: event.regionId));
    }
    if (event.currency != null) {
      add(PostingAdGetMinimumPriceEvent());
    }

    emit(PASingleton.choose(state, event));
  }

  FutureOr<void> _getGasEquipments(
      PostingAdGetGasEquipments event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await gasEquipmentsUseCase.call({'limit': 100, 'offset': 0});
    if (result.isRight) {
      final gasEquipments = result.right.results;
      emit(state.copyWith(
        gasEquipments: gasEquipments,
        status: FormzStatus.submissionSuccess,
      ));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getEquipments(
      PostingAdGetEquipments event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await getEquipmentsUseCase.call({
      'search': '',
      'limit': 100,
      'offset': 0,
      'modelId': state.model?.id,
    });

    if (result.isRight) {
      final equipments = result.right.results;
      final selects = equipments.isEmpty
          ? <int, SO>{}
          : makeSelectsSelected(v: equipments.first.options);
      final radios = equipments.isEmpty
          ? <int, String>{}
          : makeRadiosSelected(v: equipments.first.options);
      emit(state.copyWith(
          radioOptions: radios,
          selectOptions: selects,
          equipments: equipments,
          status: FormzStatus.submissionSuccess,
          equipment: equipments.isNotEmpty && state.equipment == null
              ? equipments.first
              : null));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
    add(PostingAdGetEquipmentOptionsList());
  }

  FutureOr<void> _getEquipmentOptionsList(
      PostingAdGetEquipmentOptionsList event,
      Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await getEquipmentOptionsListUseCase.call({
      'search': '',
      'limit': 1000,
      'offset': 0,
    });
    if (result.isRight) {
      emit(state.copyWith(
        equipmentOptionsList: result.right.results,
        status: FormzStatus.submissionSuccess,
      ));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Map<int, String> makeRadiosSelected(
      {required List<EquipmentOptionsEntity> v}) {
    var data = <int, String>{};

    for (var i = 0; i < v.length; i++) {
      if (v[i].option.type == 'radio') {
        data[v[i].option.id] = v[i].option.name;
      }
    }
    return data;
  }

  Map<int, SO> makeSelectsSelected({required List<EquipmentOptionsEntity> v}) {
    var data = <int, SO>{};

    for (var i = 0; i < v.length; i++) {
      if (v[i].option.type == 'select') {
        data[v[i].option.id] = SO(id: v[i].item.id, optionName: v[i].item.name);
      }
    }
    return data;
  }

  /// this function is for setting each equipment's options to all options
  /// every single time when model's equipment changed whether it's valid or not
  /// it will be called
  FutureOr<void> _getChangeOption(
      PostingAdChangeOption event, Emitter<PostingAdState> emit) {
    log(':::::::::::   get change option triggered    ::::::::::::::');
    if (event.isAdd) {
      if (event.type == 'select') {
        var isEquipmentToNull = false;
        var m = state.selectOptions.map(MapEntry.new);
        int? lastEquipmentId;
        EquipmentEntity? equipment;

        if (event.selectOption?.id == -1) {
          /// if unnecessary selected -> remove select

          lastEquipmentId = state.equipment?.id;

          m.remove(event.id);
          equipment = PASingleton.isEquipmentFull(
              equipment: state.equipment ??
                  state.equipments
                      .firstWhere((e) => e.id == state.lastEquipmentId),
              sR: state.radioOptions,
              sS: m,
              where: 'line 754');
        } else {
          log(':::::::::::  contains lastEquipmentId: ${state.equipments.any((e) => e.id == state.lastEquipmentId)}  lastEquipmentId: ${state.lastEquipmentId}  ::::::::::::::');
          m[event.id] = event.selectOption!;
          equipment = PASingleton.isEquipmentFull(
            where: 'line 756',
            equipment: state.equipment ??
                state.equipments
                    .firstWhere((e) => e.id == state.lastEquipmentId),
            sS: m,
            sR: state.radioOptions,
          );
        }

        emit(
          state.copyWith(
            equipment: equipment,
            lastEquipmentId: lastEquipmentId,
            selectOptions: m,
            isEquipmentToNull: equipment == null,
          ),
        );
      } else {
        /// for add radios
        var m = state.radioOptions.map(MapEntry.new);
        EquipmentEntity? equipment;

        log(':::::::::::  contains lastEquipmentId radio: ${state.equipments.any((e) => e.id == state.lastEquipmentId)}  lastEquipmentId in radio: ${state.lastEquipmentId}  ::::::::::::::');
        m[event.id] = event.itemName;
        if (state.equipments.any((e) => e.id == state.lastEquipmentId)) {
          equipment = PASingleton.isEquipmentFull(
            where: 'line 788',
            equipment: state.equipments
                .firstWhere((e) => e.id == state.lastEquipmentId),
            sR: m,
            sS: state.selectOptions,
          );
        }

        emit(state.copyWith(
          isLastEquipmentIdToNull: equipment != null,
          radioOptions: m,
          equipment: equipment,
        ));
      }
    } else {
      /// ELSE OF isAdd -> for remove
      var lastEquipmentId;
      if (event.type == 'select') {
        /// remove for -> selects

        var m = state.selectOptions.map(MapEntry.new)..remove(event.id);
        final equipment = PASingleton.isEquipmentFull(
            equipment: state.equipment ??
                state.equipments
                    .firstWhere((e) => e.id == state.lastEquipmentId),
            sR: state.radioOptions,
            sS: m,
            where: 'line 833');

        if (equipment == null) {
          lastEquipmentId = state.equipment?.id;
        }

        emit(
          state.copyWith(
            equipment: equipment,
            isEquipmentToNull: equipment == null,
            lastEquipmentId: lastEquipmentId,
            selectOptions: m,
          ),
        );
      } else {
        /// for remove -> radios

        var m = state.radioOptions.map(MapEntry.new)..remove(event.id);
        final equipment = PASingleton.isEquipmentFull(
            equipment: state.equipment ??
                state.equipments
                    .firstWhere((e) => e.id == state.lastEquipmentId),
            sR: m,
            sS: state.selectOptions,
            where: 'line 866');

        if (equipment == null) {
          lastEquipmentId = state.equipment?.id;
        }

        emit(
          state.copyWith(
            equipment: equipment,
            isEquipmentToNull: equipment == null,
            lastEquipmentId: lastEquipmentId,
            radioOptions: m,
          ),
        );
      }
    }
  }
}
