// ignore_for_file: omit_local_variable_types, prefer_final_locals, duplicate_ignore

part of 'posting_ad_bloc.dart';

/// PostingAd Singleton
class PASingleton {
  PASingleton._();

  static Future<FormData> create(PostingAdState v) async {
    log(':::::::::::   CREATE ANNOUNCEMENT TRIGGERED IN SINGLETON:     ::::::::::::::');

    log(':::::::::::   EQIPMENT FOR COMPLETED    ::::::::::::::');
    // ignore: prefer_final_locals
    var announcementFields = <String, dynamic>{
      'make': v.make?.id,
      'model': v.model?.id,
      'generation': v.generationId,
      'body_type': v.bodyType?.id,
      'drive_type': v.driveTypeId,
      'engine_type': v.engineId,
      'gearbox_type': v.gearbox?.id,
      'year': v.yearEntity?.id,
      'modification_type': v.modification?.id,
      'color': v.colorName,
      'licence_type': v.licenceType,
      'ownership': v.ownerStep,
      'purchase_date': v.purchasedDate,
      'description': v.description,
      'is_registered_locally': !v.notRegisteredInUzbekistan,
      'contact_name': v.ownerName,
      'contact_email': v.ownerEmail,
      'contact_phone': v.ownerPhone,
      'region': v.regionId,
      'district': v.districtId,
      'location_url': v.locationUrl,
      'price': v.price?.replaceAll(' ', ''),
      'currency': v.currency,
      'distance_traveled': (v.isWithoutMileage ?? false)
          ? '0'
          : (v.mileage?.replaceAll(' ', '') ?? '0'),
      'contact_available_from': v.callTimeFrom,
      'contact_available_to': v.callTimeTo,
      'registration_vin': 'KENTEKENMEWIJS',
      'registration_plate': 'KENTEKENMEWIJS',
      'registration_certificate': 'KENTEKENMEWIJS',
      'registration_serial_number': 'KENTEKENMEWIJS',
      'registered_in_uzbekistan': !v.notRegisteredInUzbekistan,
      'is_new': v.isWithoutMileage,
      'is_rent_with_purchase':
          v.rentWithPurchaseConditions.isNotEmpty && (v.rentToBuy ?? false),
      'rent_with_purchase': v.rentWithPurchaseConditions.entries
          .map((e) => e.value.toApi())
          .toList(),
      'equipment': v.equipment?.id,
      'gas_equipment': v.gasEquipmentId,
    };

    log(':::::::::::   BASICS INITIALIZED    ::::::::::::::');
    if (v.milageImage != null && v.milageImage!.isNotEmpty) {
      final milageImage = await MultipartFile.fromFile(v.milageImage!);
      final List<MultipartFile> list = [milageImage];
      announcementFields
          .addEntries(list.map((e) => MapEntry('mileage_image', e)));
    }
    log(':::::::::::   MILAGE IMAGE INITIALIZED    ::::::::::::::');

    var i = -1;
    announcementFields.addEntries(v.damagedParts.entries.map((e) {
      i++;
      return MapEntry('damaged_parts[$i]part', e.key.value);
    }));
    i = -1;
    announcementFields.addEntries(v.damagedParts.entries.map((e) {
      i++;
      return MapEntry('damaged_parts[$i]damage_type', e.value.value);
    }));
    log(':::::::::::   DAMAGED PARTS INITIALIZED    ::::::::::::::');

    var images = <MultipartFile>[];

    for (final element in [...v.gallery, ...v.panaramaGallery]) {
      final multiParFile = await MultipartFile.fromFile(element);
      images.add(multiParFile);
    }
    log(':::::::::::   IMAGES INITIALIZED    ::::::::::::::');
    i = -1;
    announcementFields.addEntries(images.map((e) {
      i++;
      return MapEntry('gallery[$i]', e);
    }));
    i = -1;
    announcementFields.addEntries(v.radioOptions.entries.map((e) {
      i++;
      return MapEntry('options[$i]', e.key);
    }));
    log(':::::::::::   OPTIONS INITIALIZED    ::::::::::::::');
    i = -1;
    announcementFields.addEntries(v.selectOptions.entries.map((e) {
      i++;
      return MapEntry('option_items[$i]', e.value.id);
    }));
    log(':::::::::::   OPTION ITEMS  INITIALIZED    ::::::::::::::');

    log('ANNOUNCEMENT FIELDS BEFORE FORMDATALIZE: ${announcementFields.toString()} \n Seperator Seperator Seperator Seperator Seperator Seperator Seperator Seperator Seperator ');
    final announcementFormData = FormData.fromMap(announcementFields);

    return announcementFormData;
  }

  static Map<String, dynamic> getMiniPrice(PostingAdState state) => {
        'make': state.make?.id,
        'model': state.model?.id,
        'currency': state.currency
      };

  static PostingAdState initUserFromApi(UserModel user, PostingAdState state) =>
      state.copyWith(
        contactsFormKey: GlobalKey<FormState>(),
        isContactsVerified: true,
        showOwnerContacts: true,
        status: FormzStatus.submissionSuccess,
        phoneController: TextEditingController(
            text: MyFunctions.phoneFormat(user.phoneNumber.substring(4))),
        emailController: TextEditingController(text: user.email),
        nameController: TextEditingController(text: user.fullName),
        ownerEmail: user.email,
        ownerName: user.fullName,
        ownerPhone: user.phoneNumber.substring(4),
        userModel: user,
      );

  static PostingAdState initUserFromState(PostingAdState state) =>
      state.copyWith(
          contactsFormKey: GlobalKey<FormState>(),
          phoneController: TextEditingController(
              text: MyFunctions.phoneFormat(
                  state.userModel!.phoneNumber.substring(4))),
          emailController: TextEditingController(text: state.userModel!.email),
          nameController:
              TextEditingController(text: state.userModel!.fullName),
          ownerEmail: state.userModel?.email,
          ownerName: state.userModel?.fullName,
          ownerPhone: state.userModel?.phoneNumber.substring(4),
          showOwnerContacts: true,
          isContactsVerified: true,
          status: FormzStatus.submissionSuccess);

  static Map<DamagedParts, DamageType> damagedPartAdopter(
      List<DamagedPartsEntity> damages) {
    var result = <DamagedParts, DamageType>{};
    for (final v in damages) {
      final part = _getDamagePart(v.part);
      final type = _getDamageType(v.damageType);
      if (part != null && type != null) {
        result[part] = type;
      }
    }
    return result;
  }

  static PostingAdState choose(
          PostingAdState state, PostingAdChooseEvent event) =>
      state.copyWith(
        isEquipmentToNull: event.isEquipmentToNull ?? false,
        createStatus: event.createStatus,
        milageImage: event.milageImage,
        modification: event.modification,
        panaramaGallery: event.panaramaGallery,
        mapPointBytes: event.bodyBytes,
        years: event.years,
        yearEntity: event.yearEntity,
        locationUrl: event.locationUrll,
        toastMessage: event.toastMessage,
        damagedParts: event.damagedParts,
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
        licenceType: event.typeDocument,
        colorName: event.colorName,
        gearbox: event.gearbox,
        driveTypeId: event.driveTypeId,
        engineId: event.engineId,
        generationId: event.generationId,
        bodyType: event.bodyType,
        isSortByLetter: event.letter != state.letter,
        model: event.model,
        eventLetter: event.letter,
        make: event.make,
        purchasedDate: event.purchasedDate,
        notRegisteredInUzbekistan: event.isRastamojen,
        ownerEmail: event.ownerEmail,
        ownerName: event.ownerName,
        ownerPhone: event.ownerPhone,
        city: event.city,
        regionId: event.regionId,
        price: event.price,
        currency: event.currency,
        districtId: event.districtId,
        phoneController: event.phoneController,
        emailController: event.emailController,
        nameController: event.nameController,
        eventMakeScrrollIndex: _getMakeLetterIndex(event, state.makes),
        description: event.description,
        gasEquipmentId: event.gasEquipmentId,
        getModificationStatus: event.getModificationStatus,
      );

  static int? _getMakeLetterIndex(
      PostingAdChooseEvent event, List<MakeEntity> makes) {
    if (event.letter == null) return null;

    final i = makes.indexWhere(
        (element) => element.name.toUpperCase().startsWith(event.letter!));

    if (i > -1) return i;

    return null;
  }

  static DamageType? _getDamageType(String type) {
    switch (type) {
      case 'ideal':
        return DamageType.ideal;

      case 'with_dents':
        return DamageType.withDents;

      case 'scratched':
        return DamageType.scratched;

      case 'replaced':
        return DamageType.replaced;

      case 'requires_replacement':
        return DamageType.requiresReplacement;
      default:
        return null;
    }
  }

  static DamagedParts? _getDamagePart(String part) {
    switch (part) {
      // 1
      case 'rigth_front_door':
        return DamagedParts.rightFrontDoor;
      // 2
      case 'right_rear_door':
        return DamagedParts.rightRearDoor;
      // 3
      case 'left_front_door':
        return DamagedParts.leftFrontDoor;
      // 4
      case 'left_rear_door':
        return DamagedParts.leftRearDoor;
      // 5
      case 'front_bumper':
        return DamagedParts.frontBumper;
      // 6
      case 'rear_bumper':
        return DamagedParts.rearBumper;
      // 7
      case 'front_left_fender':
        return DamagedParts.frontLeftFender;
      // 8
      case 'front_right_fender':
        return DamagedParts.frontRightFender;
      // 9
      case 'rear_left_fender':
        return DamagedParts.rearLeftFender;
      // 10
      case 'rear_right_fender':
        return DamagedParts.rearRightFender;
      // 11
      case 'roof':
        return DamagedParts.roof;
      // 12
      case 'hood':
        return DamagedParts.hood;
      // 13
      case 'trunk':
        return DamagedParts.trunk;
      default:
        return null;
    }
  }

  static bool nextButtonIsDisabled(int page, PostingAdState state) {
    switch (page) {
      //make
      case 0:
        return state.make == null;
// model
      case 1:
        return state.model == null;
      // year
      case 2:
        return state.yearEntity == null;
      // generation
      case 3:
        return state.generationId == null;
      // body type
      case 4:
        return state.bodyType == null;
      // engine
      case 5:
        return state.engineId == null;
      // drive type
      case 6:
        return state.driveTypeId == null;
      // gearbox
      case 7:
        return state.gearbox == null;
      // ModificationScreen
      case 8:
        return state.modification == null;
      // ColorsScreen
      case 9:
        return false;
      // AddPhotoScreen
      case 10:
        // return false;
        return [...state.gallery, ...state.panaramaGallery].isEmpty;
      // PtsScreen
      case 11:
        return state.ownerStep == null ||
            state.licenceType == null ||
            state.purchasedDate == null;
      //  DescriptionScreen
      case 12:
        return false;
      //  EquipmentScreen
      case 13:
        return false;
      // DamageScreen
      case 14:
        return state.damagedParts.isEmpty;
      // ContactsScreen
      case 15:
        final v = !((state.contactsFormKey.currentState?.validate() ?? false) ||
            state.isContactsVerified);
        log(':::::::::: ownername in validation of next button: ${state.ownerName}  ::::::::::');
        return v;
// InspectionPlaceScreen
      case 16:
        return !(state.regionId != null || state.mapPointBytes != null);

      // PriceScreen
      case 17:
        return state.price == null || (state.price?.isEmpty ?? true);
      // MileageScreen
      case 18:
        final milage =
            int.tryParse(state.mileage?.replaceAll(' ', '') ?? '0') ?? 0;

        final v = !(milage > 0 ||
            (state.isWithoutMileage ?? false) ||
            state.milageImage != null && state.milageImage!.isNotEmpty);
        return v;
      // PreviewScreen
      case 19:
        return false;
    }

    return false;
  }

  static EquipmentEntity? isEquipmentFull(
      {required EquipmentEntity? equipment,
      required Map<int, String> sR,
      required Map<int, SO> sS,required String where}) {
    log('::::::::::: where:    $where    ::::::::::::::');
    log(':::::::::: selected SS: $sS  ::::::::::');
    log(':::::::::: selected radios: $sR  ::::::::::');
    log(':::::::::: equipment options:  ${equipment?.options}  ::::::::::');

    if (equipment == null) {
      log(':::::::::::   returning due to equipment is null    ::::::::::::::');
      return null;
    }

    var i = 0;
    for (final e in equipment.options) {
      log(':::::::::::   option dot id: ${e.option.id}    ::::::::::::::');
      if (e.option.type == 'select') {
        if (sS.containsKey(e.option.id)) {
          log(':::::::::::   PLUCING FROM SELECT    ::::::::::::::');

          i++;
          continue;
        }
      } else {
        if (sR.containsKey(e.option.id)) {
          log(':::::::::::   PLUCING FROM RADIO    ::::::::::::::');
          i++;
          continue;
        }
      }
    }
    log(':::::::::: IS EQUIPMENT TO NULL I IS:  $i  equipment options length: ${equipment.options.length}::::::::::');
    log(':::::::::: selected radios length:  ${sR.length}  selects lenth: ${sS.length}::::::::::');
    if (i == equipment.options.length) {
      log(':::::::::::   returning equipment    ::::::::::::::');
      return equipment;
    } else {
      log(':::::::::::   returning  null    ::::::::::::::');
      return null;
    }
  }
}
