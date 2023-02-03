part of 'posting_ad_bloc.dart';

/// PostingAd Singleton
class PASingleton {
  PASingleton._();

  static Future<FormData> create(PostingAdState v) async {
    final announcementFields = <String, dynamic>{
      'make': v.makeId,
      'model': v.modelId,
      'generation': v.generationId,
      'body_type': v.bodyTypeId,
      'drive_type': v.driveTypeId,
      'engine_type': v.engineId,
      'gearbox_type': v.gearboxId,
      'year': v.yearEntity?.id,
      'modification_type': v.modificationId,
      'color': v.colorName,
      'licence_type': v.licenceType,
      'ownership': v.ownerStep,
      'purchase_date': v.purchasedDate,
      'description': v.description,
      'is_registered_locally': !v.notRegisteredInUzbekistan,
      'contact_name': v.ownerName,
      'contact_email': v.ownerEmail,
      'contact_phone': v.ownerPhone,
      'contact_available_from': v.callTimeFrom,
      'contact_available_to': v.callTimeTo,
      'region': v.regionId,
      'district': v.districtId,
      'location_url': v.locationUrl,
      'price': v.price!.replaceAll(' ', ''),
      'currency': v.currency,
      'distance_traveled': (v.isWithoutMileage ?? false)
          ? '0'
          : (v.mileage?.replaceAll(' ', '') ?? '0'),
      'registration_vin': 'KENTEKENMEWIJS',
      'registration_plate': 'KENTEKENMEWIJS',
      'registration_certificate': 'KENTEKENMEWIJS',
      'registration_serial_number': 'KENTEKENMEWIJS',
      'registered_in_uzbekistan': !v.notRegisteredInUzbekistan,
      'is_new': v.isWithoutMileage,
      'is_rent_with_purchase':
          v.rentWithPurchaseConditions.isNotEmpty && (v.rentToBuy ?? false),
      'rent_with_purchase':
          v.rentWithPurchaseConditions.map((e) => e.toApi()).toList(),
    };
    // if (v.milageImage != null && v.milageImage!.isNotEmpty) {
    // final milageImage = await MultipartFile.fromFile(v.milageImage!);
    // final List<MultipartFile> list = [milageImage];
    // announcementFields.addEntries(list.map((e) => MapEntry('mileage_image', e)));
    // }

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

    final announcementFormData = FormData.fromMap(announcementFields);
    // for (int i = 0; i < announcementFormData.fields.length; i++) {
    // if (announcementFormData.files[i].key.contains('mileage_image')) {
    //   print(
    //       '=> => => =>     this is milage image value and key:  ${announcementFormData.files[i].key}  / ${announcementFormData.files[i].value}  <= <= <= <=');

    //   await Future.delayed(Duration(milliseconds: 4000));
    // }
    //   print(
    //       '=> => => =>    ann: ${announcementFormData.fields[i].key}  / ${announcementFormData.fields[i].value}   <= <= <= <=');
    // }

    return announcementFormData;
  }

  static Map<String, dynamic> getMiniPrice(PostingAdState state) => {
        'make': state.makeId,
        'model': state.modelId,
        'currency': state.currency
      };

  static PostingAdState initUserFromApi(UserModel user, PostingAdState state) =>
      state.copyWith(
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

  static PostingAdState stateForEdit(CarSingleEntity v) {
    String? phone = '';
    try {
      phone = MyFunctions.phoneFormat(v.user.phoneNumber.substring(4));
    } catch (e) {
      phone = null;
    }

    return PostingAdState(
      isContactsVerified: true,
      searchController: TextEditingController(),
      phoneController: TextEditingController(text: phone ?? v.user.phoneNumber),
      emailController: TextEditingController(),
      nameController: TextEditingController(
          text: v.user.name.isEmpty ? v.user.fullName : v.user.name),
      status: FormzStatus.submissionSuccess,
      bodyTypeId: v.bodyType.id,
      callTimeFrom: v.contactAvailableFrom.trim().substring(0, 5),
      callTimeTo: v.contactAvailableTo.trim().substring(0, 5),
      colorName: v.color,
      damagedParts: damagedPartAdopter(v.damagedParts),
      currency: v.currency,
      description: v.description,
      driveTypeId: v.driveType.id,
      engineId: v.engineType.id,
      gearboxId: v.gearboxType.id,
      generationId: v.gearboxType.id,
      isWithoutMileage: !(v.distanceTraveled > 0),
      makeId: v.make.id,
      modelId: v.model.id,
      ownerName: v.user.name.isEmpty ? v.user.fullName : v.user.name,
      ownerPhone: phone ?? v.user.phoneNumber,
      ownerStep: v.ownership,
      price: v.price,
      mileage: '${v.distanceTraveled}',
      purchasedDate: v.purchaseDate,
      notRegisteredInUzbekistan: v.registeredInUzbekistan,
    );
  }

  static PostingAdState choose(
          PostingAdState state, PostingAdChooseEvent event) =>
      state.copyWith(
          milageImage: event.milageImage,
          modificationId: event.modificationId,
          panaramaGallery: event.panaramaGallery,
          mapPointBytes: event.bodyBytes,
          years: event.years,
          yearEntity: event.yearEntity,
          locationUrl: event.locationUrl,
          toastMessage: event.toastMessage,
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
          isSortByLetter: event.letter != state.letter,
          modelId: event.modelId,
          eventLetter: event.letter,
          makeId: event.makeId,
          purchasedDate: event.purchasedDate,
          notRegisteredInUzbekistan: event.isRastamojen,
          ownerEmail: event.ownerEmail,
          ownerName: event.ownerName,
          ownerPhone: event.ownerPhone,
          city: event.city,
          regionId: event.regionId,
          price: event.price,
          currency: event.currency,
          gasBalloonType: event.gasBalloonType,
          districtId: event.districtId,
          phoneController: event.phoneController,
          emailController: event.emailController,
          nameController: event.nameController,
          eventMakeScrrollIndex: _getMakeLetterIndex(event, state.makes));

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

  static bool buttonStatus(int page, PostingAdState state) {
    switch (page) {
      //make
      case 0:
        return state.makeId == null;
// model
      case 1:
        return state.modelId == null;
      // year
      case 2:
        return state.yearEntity == null;
      // generation
      case 3:
        return state.generationId == null;

      // body type
      case 4:
        return state.bodyTypeId == null;
      // engine
      case 5:
        return state.engineId == null;
      // drive type
      case 6:
        return state.driveTypeId == null;
      // gearbox
      case 7:
        return state.gearboxId == null;
      // ModificationScreen
      case 8:
        return state.modificationId == null;
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
        return !state.isContactsVerified;
// InspectionPlaceScreen
      case 16:
        return state.regionId == null;

      // PriceScreen
      case 17:
        return state.price == null;
      // MileageScreen
      case 18:
        final milage =
            int.tryParse(state.mileage?.replaceAll(' ', '') ?? '0') ?? 0;

        return !(milage > 0 ||
            (state.isWithoutMileage ?? false) ||
            state.milageImage != null);
      // PreviewScreen
      case 19:
        return false;
    }

    return false;
  }
}
