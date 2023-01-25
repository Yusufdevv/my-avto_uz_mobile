part of 'posting_ad_bloc.dart';

/// PostingAd
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
      'year': v.yearsEntity!.id,
      'modification_type': 2,
      'color': v.colorName,
      'purchase_date': v.purchasedDate,
      'description': v.description,
      'is_registered_locally': v.registeredInUzbekistan,
      'contact_name': v.ownerName,
      'contact_email': v.ownerEmail,
      'contact_phone': v.ownerPhone,
      'contact_available_from': v.callTimeFrom,
      'contact_available_to': v.callTimeTo,
      'region': v.region!.id,
      'district': v.districtId,
      'price': v.price,
      'currency': v.currency,
      'distance_traveled': v.mileage,
      'registration_vin': 'KENTEKENMEWIJS',
      'registration_plate': 'KENTEKENMEWIJS',
      'registration_certificate': 'KENTEKENMEWIJS',
      'registration_serial_number': 'KENTEKENMEWIJS',
      'registered_in_uzbekistan': v.registeredInUzbekistan,
      'is_new': v.registeredInUzbekistan,
      'licence_type': v.typeDocument,
      'ownership': v.ownerStep,
      'location_url': v.locationUrl,
    };

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

    for (final element in v.gallery) {
      final multiParFile = await MultipartFile.fromFile(
        element,
      );
      images.add(multiParFile);
    }
    i = -1;
    announcementFields.addEntries(images.map((e) {
      i++;
      return MapEntry('gallery[$i]', e);
    }));

    final announcementFormData = FormData.fromMap(announcementFields);

    return announcementFormData;
  }

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

  static PostingAdState stateForEdit(CarSingleEntity v) {
    String? phone = '';
    try {
      phone = MyFunctions.phoneFormat(v.user.phoneNumber.substring(4));
    } catch (e) {
      phone = null;
    }

    return PostingAdState(
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
      registeredInUzbekistan: v.registeredInUzbekistan,
    );
  }

  static PostingAdState choose(
          PostingAdState state, PostingAdChooseEvent event) {
            
            
            print('=> => => => LOCATION URL    ${event.locationUrl}    <= <= <= <=');
            return state.copyWith(
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
        districtId: event.districtId,
        phoneController: event.phoneController,
        emailController: event.emailController,
        nameController: event.nameController,
      );}
      
}
