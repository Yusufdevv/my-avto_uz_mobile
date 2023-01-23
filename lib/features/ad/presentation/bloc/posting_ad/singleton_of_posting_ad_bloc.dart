part of 'posting_ad_bloc.dart';

/// PostingAd
class PASingleton {
  PASingleton._();
  static AnnouncementToPostModel create(PostingAdState state) =>
      AnnouncementToPostModel(
        id: -1,
        bodyType: state.bodyTypeId!,
        color: state.colorName,
        contactAvailableFrom: state.callTimeFrom!,
        contactAvailableTo: state.callTimeTo!,
        contactEmail: state.ownerEmail,
        contactName: state.ownerName!,
        contactPhone: state.ownerPhone!,
        currency: state.currency,
        damagedParts: state.damagedParts.entries
            .map((e) =>
                DamagedPartEntity(damageType: e.value.value, part: e.key.value))
            .toList(),
        description: state.description,
        distanceTraveled: int.tryParse(state.mileage ?? '1000') ?? 1000,
        district: state.districtId!,
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
      );

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
    print(
        '=> => => =>   IS CONTACTS VERIFIED IN CHOOSE:   ${event.isContactsVerified}    <= <= <= <=');
    final v = state.copyWith(

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


phoneController:event.phoneController,
emailController:event.emailController,
nameController:event.nameController,

      
    );
    print(
        '=> => => =>  outcoming is verified contacts:   ${v.isContactsVerified}    <= <= <= <=');
    return v;
  }
}
