// ignore_for_file: omit_local_variable_types, prefer_final_locals, duplicate_ignore

part of 'posting_ad_bloc.dart';

/// PostingAd Singleton
class PASingleton {
  PASingleton._();

  static Future<FormData> create(PostingAdState v) async {
    // ignore: prefer_final_locals
    var announcementFields = <String, dynamic>{
      'longitude': v.long,
      'latitude': v.lat,
      'make': v.make?.id,
      'model': v.model?.id,
      'generation': v.generation?.id,
      'body_type': v.bodyType?.id,
      'drive_type': v.driveTypeId,
      'engine_type': v.engine?.id,
      'gearbox_type': v.gearbox?.id,

      /// yearBegin is not true
      'year': v.yearEntity?.yearBegin,
      'modification_type': v.modification?.id,
      'color': 1,
      'licence_type': v.licenceType,
      'ownership': v.ownerStep,
      'purchase_date': v.purchasedDate,
      'description': v.description,
      'is_registered_locally': !v.notRegisteredInUzbekistan,
      'contact_name': v.ownerName,
      'contact_email': v.ownerEmail,
      'contact_phone': v.ownerPhone,
      'region': v.region?.id,
      'district': v.district?.id,
      'location_url':
          'https://yandex.com/maps/10335/tashkent/?ll=${v.long}%2C${v.lat}&z=15',
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
      // 'rent_with_purchase': v.rentWithPurchaseConditions.entries
      //     .map((e) => e.value.toApi())
      //     .toList(),

      'equipment': v.equipment?.id,
      'gas_equipment': v.gasEquipmentId,
    };

    if (v.milageImage != null && v.milageImage!.isNotEmpty) {
      final milageImage = await MultipartFile.fromFile(v.milageImage!);
      final List<MultipartFile> list = [milageImage];
      announcementFields
          .addEntries(list.map((e) => MapEntry('mileage_image', e)));
    }

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

    var images = <MultipartFile>[];

    for (final element in [...v.gallery, ...v.panaramaGallery]) {
      final multiParFile = await MultipartFile.fromFile(element);
      images.add(multiParFile);
    }
    i = -1;
    announcementFields.addEntries(images.map((e) {
      i++;
      return MapEntry('gallery[$i]', e);
    }));
    i = -1;
    Map<int, String> rO = v.equipment == null
        ? v.radioOptions
        : _removeEquipmentContainingRadios(v.equipment!, v.radioOptions);
    announcementFields.addEntries(rO.entries.map((e) {
      i++;
      return MapEntry('options[$i]', e.key);
    }));
    i = -1;

    Map<int, SO> selectedOptions = v.equipment == null
        ? v.selectOptions
        : _removeEquipmentContainingSelects(v.equipment!, v.selectOptions);
    announcementFields.addEntries(selectedOptions.entries.map((e) {
      i++;
      return MapEntry('option_items[$i]', e.value.id);
    }));
    // 'prepayment': prepayment,
    // 'rental_period': rentalPeriod,
    // 'monthly_payment': monthlyPayment,

    i = -1;
    announcementFields.addEntries(v.rentWithPurchaseConditions.entries.map((e) {
      i++;
      return MapEntry('rent_with_purchase[$i]prepayment', e.value.prepayment);
    }));
    i = -1;
    announcementFields.addEntries(v.rentWithPurchaseConditions.entries.map((e) {
      i++;
      return MapEntry(
          'rent_with_purchase[$i]monthly_payment', e.value.monthlyPayment);
    }));
    i = -1;
    announcementFields.addEntries(v.rentWithPurchaseConditions.entries.map((e) {
      i++;
      return MapEntry(
          'rent_with_purchase[$i]rental_period', e.value.rentalPeriod);
    }));

    log('ANNOUNCEMENT FIELDS BEFORE FORMDATALIZE: ${announcementFields.toString()} \n Seperator Seperator Seperator Seperator Seperator Seperator Seperator Seperator Seperator ');
    final announcementFormData =
        FormData.fromMap(announcementFields, ListFormat.multiCompatible);

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

  static Map<DamagedPart, DamageType> damagedPartAdopter(
      List<DamagedPartsEntity> damages) {
    var result = <DamagedPart, DamageType>{};
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

  static DamagedPart? _getDamagePart(String part) {
    switch (part) {
      // 1
      case 'rigth_front_door':
        return DamagedPart.rightFrontDoor;
      // 2
      case 'right_rear_door':
        return DamagedPart.rightRearDoor;
      // 3
      case 'left_front_door':
        return DamagedPart.leftFrontDoor;
      // 4
      case 'left_rear_door':
        return DamagedPart.leftRearDoor;
      // 5
      case 'front_bumper':
        return DamagedPart.frontBumper;
      // 6
      case 'rear_bumper':
        return DamagedPart.rearBumper;
      // 7
      case 'front_left_fender':
        return DamagedPart.frontLeftFender;
      // 8
      case 'front_right_fender':
        return DamagedPart.frontRightFender;
      // 9
      case 'rear_left_fender':
        return DamagedPart.rearLeftFender;
      // 10
      case 'rear_right_fender':
        return DamagedPart.rearRightFender;
      // 11
      case 'roof':
        return DamagedPart.roof;
      // 12
      case 'hood':
        return DamagedPart.hood;
      // 13
      case 'trunk':
        return DamagedPart.trunk;
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
        return state.generation == null;
      // body type
      case 4:
        return state.bodyType == null;
      // engine
      case 5:
        return state.engine == null;
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
        final v = !(((state.contactsFormKey.currentState?.validate() ??
                    false) &&
                state.isContactsVerified) ||
            state.nameController.text.isNotEmpty && state.isContactsVerified);
        return v;
// InspectionPlaceScreen
      case 16:
        return !(state.region != null && state.district != null);

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

  static EquipmentEntity? isEquipmentAvailable({
    required List<EquipmentEntity> equipments,
    required int? lastEquipmentId,
    required String where,
  }) {
    final v = equipments.any((e) => e.id == lastEquipmentId)
        ? equipments.firstWhere((e) => e.id == lastEquipmentId)
        : null;
    return v;
  }

  static EquipmentEntity? isEquipmentFull(
      {required EquipmentEntity? equipment,
      required Map<int, String> sR,
      required Map<int, SO> sS}) {
    if (equipment == null) {
      return null;
    }

    var idf = 0;
    for (final e in equipment.options) {
      if (e.option.type == 'select') {
        if (sS.containsKey(e.option.id)) {
          if (e.item.id == sS[e.option.id]?.id) {
            idf++;
            continue;
          }
        }
      } else {
        if (sR.containsKey(e.option.id)) {
          idf++;
          continue;
        }
      }
    }
    if (idf == equipment.options.length) {
      return equipment;
    } else {
      return null;
    }
  }

  static Map<int, String> _removeEquipmentContainingRadios(
      EquipmentEntity equipment, Map<int, String> radios) {
    Map<int, String> rO = radios;
    for (final e in equipment.options) {
      if (e.option.type == 'radio') {
        if (rO.containsKey(e.option.id)) {
          rO.remove(e.option.id);
        }
      }
    }
    return rO;
  }

  static Map<int, SO> _removeEquipmentContainingSelects(
      EquipmentEntity equipment, Map<int, SO> selects) {
    Map<int, SO> selectedOptions = selects;
    for (final e in equipment.options) {
      if (e.option.type == 'select') {
        if (selectedOptions.containsKey(e.option.id)) {
          if (selectedOptions[e.option.id]?.id == e.item.id) {
            selectedOptions.remove(e.option.id);
          }
        }
      }
    }
    return selectedOptions;
  }

  static Map<int, SO> makeSelectsSelected(
      {required List<EquipmentOptionsEntity> v}) {
    var data = <int, SO>{};

    for (var i = 0; i < v.length; i++) {
      if (v[i].option.type == 'select') {
        data[v[i].option.id] = SO(id: v[i].item.id, optionName: v[i].item.name);
      }
    }
    return data;
  }

  static Map<int, String> makeRadiosSelected(
      {required List<EquipmentOptionsEntity> v}) {
    var data = <int, String>{};

    for (var i = 0; i < v.length; i++) {
      if (v[i].option.type == 'radio') {
        data[v[i].option.id] = v[i].option.name;
      }
    }
    return data;
  }
}
