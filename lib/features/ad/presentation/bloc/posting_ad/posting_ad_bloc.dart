import 'dart:async';

import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/data/models/announcement_to_post_model.dart';
import 'package:auto/features/ad/domain/entities/announcement/announcement_entity_to_post.dart';
import 'package:auto/features/ad/domain/entities/damaged_part/damaged_part.dart';
import 'package:auto/features/ad/domain/entities/district_entity.dart';
import 'package:auto/features/ad/domain/entities/generation/generation.dart';
import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/engine_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/entities/years/years.dart';
import 'package:auto/features/ad/domain/usecases/create_announcement.dart';
import 'package:auto/features/ad/domain/usecases/get_body_type.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ad/domain/usecases/get_drive_type.dart';
import 'package:auto/features/ad/domain/usecases/get_engine_type.dart';
import 'package:auto/features/ad/domain/usecases/get_generation.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/cars_item.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/rent/domain/usecases/get_gearboxess_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'posting_ad_event.dart';
part 'posting_ad_state.dart';

class PostingAdBloc extends Bloc<PostingAdEvent, PostingAdState> {
  final CreateAnnouncementUseCase createUseCase;
  final GetGearBoxessUseCase gearboxUseCase;
  final GetDriveTypeUseCase driveTypeUseCase;
  final GetEngineTypeUseCase engineUseCase;
  final GetCarModelUseCase modelsUseCase;
  final GetGenerationUseCase generationUseCase;
  final GetMakesUseCase makeUseCase;
  final GetTopBrandUseCase topMakesUseCase;
  final GetBodyTypeUseCase bodyTypesUseCase;

  PostingAdBloc({
    required this.makeUseCase,
    required this.topMakesUseCase,
    required this.generationUseCase,
    required this.modelsUseCase,
    required this.engineUseCase,
    required this.driveTypeUseCase,
    required this.gearboxUseCase,
    required this.bodyTypesUseCase,
    required this.createUseCase,
  }) : super(const PostingAdState(status: FormzStatus.pure)) {
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
    on<PostingAdCreateEvent>(_create);
    on<PostingAdDamageEvent>(_damage);
  }

  FutureOr<void> _damage(
      PostingAdDamageEvent event, Emitter<PostingAdState> emit) {
    print('=> => => =>     ${event.part} / ${event.type}    <= <= <= <=');
    final damages =
        state.damagedParts.map((key, value) => MapEntry(key, value));
    print('=> => => => initialized by state    $damages    <= <= <= <=');
    damages[event.part] = event.type;
    print('=> => => => after ad     $damages    <= <= <= <=');
    emit(state.copyWith(damagedParts: damages));
  }

  FutureOr<void> _create(
      PostingAdCreateEvent event, Emitter<PostingAdState> emit) async {
    print(
        '=> => => => purchase date:  ${state.purchasedDate!.substring(0, 10)}    <= <= <= <=');
    print('=> => => =>  gallery:   ${state.gallery}    <= <= <= <=');
    print('=> => => =>  typeDocument:   ${state.typeDocument}    <= <= <= <=');
    print('=> => => =>  ownerStep:   ${state.ownerStep}    <= <= <= <=');

    print('=> => => =>  ownerStep:   ${state.currency}    <= <= <= <=');
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await createUseCase.call(
      AnnouncementToPostModel(
        id: -1,
        bodyType: state.bodyTypeId!,
        color: state.colorName,
        contactAvailableFrom: state.callTimeFrom!.replaceAll(' ', ''),
        contactAvailableTo: state.callTimeTo!.replaceAll(' ', ''),
        contactEmail: state.ownerEmail,
        contactName: state.ownerName!,
        contactPhone: state.ownerPhone!,
        currency: state.currency!,
        damagedParts: state.damagedParts.entries
            .map((e) =>
                DamagedPartEntity(damageType: e.value.value, part: e.key.value))
            .toList(),
        description: state.descriptions,
        distanceTraveled: int.tryParse(state.mileage ?? '1000') ?? 1000,
        district: state.district!.id,
        driveType: state.driveTypeId!,
        engineType: state.engineId!,
        gallery: state.gallery,
        gearboxType: state.gearboxId!,
        generation: state.generationId!,
        isNew: state.isWithoutMileage,
        isRegisteredLocally: state.registeredInUzbekistan,
        licenceType: state.typeDocument ?? 'original',
        locationUrl:
            'https://www.google.com/maps/place/Grand+Mir+Hotel/@41.2965807,69.275822,15z/data=!4m8!3m7!1s0x38ae8adce9ab4089:0x3f74710c22b9462e!5m2!4m1!1i2!8m2!3d41.296393!4d69.267908',
        make: state.makeId!,
        model: state.modelId!,
        modificationType: 2,
        ownership: state.ownerStep!,
        price: state.price!,
        purchaseDate: '2022-11-23',
        //             2018-01-20 22:02:42.000
        region: state.region!.id,
        registeredInUzbekistan: true,
        registrationCertificate: 'KENTEKENMEWIJS',
        registrationPlate: 'KENTEKENMEWIJS',
        registrationSerialNumber: '234524523423452435',
        registrationVin: 'KENTEKENMEWIJS',
        year: state.yearsEntity!.id,
      ),
    );
    if (result.isRight) {
      print('=> => => =>     RIGHT RIGHT RIGHT RIGHT       <= <= <= <=');
      emit(state.copyWith(status: FormzStatus.pure));
    } else {
      print(
          '=> => => =>     LEFT LEFT LEFT LEFT LEFT   ${result.left}  <= <= <= <=');
      emit(state.copyWith(status: FormzStatus.pure));
    }
  }

  FutureOr<void> _bodyTypes(
      PostingAdBodyTypesEvent event, Emitter<PostingAdState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await bodyTypesUseCase
        .call(BodyTypeParams(generationId: state.generationId!));

    if (result.isRight) {
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          bodyTypes: result.right.results));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _gearBoxes(
      PostingAdGearBoxesEvent event, Emitter<PostingAdState> emit) async {
    if (state.gearboxId != null && state.gearBoxes.isNotEmpty) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      return;
    }
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await gearboxUseCase.call(NoParams());
    if (result.isRight) {
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          gearBoxes: result.right.results));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _driveTypes(
      PostingAdDriveTypesEvent event, Emitter<PostingAdState> emit) async {
    if (state.driveTypeId != null && state.driveTypes.isNotEmpty) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await driveTypeUseCase.call(DriveTypeParams(
        generationId: state.generationId!,
        bodyTypeId: state.bodyTypeId!,
        engineTypeId: state.engineId!));
    if (result.isRight) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          driveTypes: result.right.results,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _engines(
      PostingAdEnginesEvent event, Emitter<PostingAdState> emit) async {
    if (state.engineId != null && state.engines.isNotEmpty) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await engineUseCase.call(EngineTypeParams(
      bodyTypeId: state.bodyTypeId!,
      generationId: state.generationId!,
    ));

    if (result.isRight) {
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          engines: result.right.results));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _models(
      PostingAdModelEvent event, Emitter<PostingAdState> emit) async {
    if (state.modelId != null && state.models.isNotEmpty) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      return;
    }
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await modelsUseCase.call(state.makeId!);
    if (result.isRight) {
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
        models: result.right.results,
      ));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _generations(
      PostingAdGenerationsEvent event, Emitter<PostingAdState> emit) async {
    if (state.generationId != null && state.generations.isNotEmpty) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await generationUseCase.call(GenerationParams(
        modelId: state.modelId!, year: state.yearsEntity!.yearBegin));
    if (result.isRight) {
      print('==== generation results:  ${result.right.results}  ====');
      emit(state.copyWith(
          generations: result.right.results,
          status: FormzStatus.submissionSuccess));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _topMakes(
      PostingAdTopMakesEvent event, Emitter<PostingAdState> emit) async {
    if (state.topMakes.isNotEmpty) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      return;
    }

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
    if (state.makeId != null && state.makes.isNotEmpty) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final result = await makeUseCase.call(event.name);
    if (result.isRight) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          makes: result.right.results,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
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
    emit(
      state.copyWith(
        damagedParts: event.damagedParts,
        rentWithPurchaseConditions: event.rentWithPurchaseConditions,
        gallery: event.gallery,
        showExactAddress: event.showExactAddress,
        isWithoutMileage: event.isWithoutMileage,
        rentToBuy: event.rentToBuy,
        isContactsVerified: event.isContactsVerified,
        showOwnerContacts: event.showOwnerContacts,
        isCallTimed: event.isCallTimed,
        callTimeTo: event.callTimeTo,
        callTimeFrom: event.callTimeFrom,
        mileage: event.mileage,
        ownerStep: event.ownerStep,
        typeDocument: event.typeDocument,
        colorName: event.colorName,
        gearboxId: event.gearboxId,
        driveTypeId: event.driveTypeId,
        engineId: event.engineId,
        generationId: event.generationId,
        bodyTypeId: event.selectedBodyTypeId,
        yearsEntity: event.yearsEntity,
        isSortByLetter: event.letter != state.letter,
        modelId: event.modelId,
        letter: event.letter,
        makeId: event.makeId,
        purchasedDate: event.purchasedDate,
        registeredInUzbekistan: event.isRastamojen,
        ownerEmail: event.ownerEmail,
        ownerName: event.ownerName,
        ownerPhone: event.ownerPhone,
        city: event.city,
        region: event.region,
        price: event.price,
        currency: event.currency,
        gasBalloonType: event.gasBalloonType,
        district: event.district,
      ),
    );
  }
}
