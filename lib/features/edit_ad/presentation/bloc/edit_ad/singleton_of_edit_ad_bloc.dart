// ignore_for_file: omit_local_variable_types, prefer_final_locals, duplicate_ignore

part of 'edit_ad_bloc.dart';

/// EditAd Singleton
class EASingleton {
  EASingleton._();

  static Future<FormData> create(EditAdState v) async {
    // ignore: prefer_final_locals
    var announcementFields = <String, dynamic>{
      'make': v.make?.id,
      'model': v.model?.id,
      'generation': v.generationEntity!.id,
      'body_type': v.bodyType!.id,
      'drive_type': v.driveTypeId,
      'engine_type': v.engineId,
      'gearbox_type': v.gearbox?.id,
      'year': v.yearEntity?.id,
      'modification_type': v.modification!.id,
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
      'price': v.price!.replaceAll(' ', ''),
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

    final announcementFormData = FormData.fromMap(announcementFields);

    return announcementFormData;
  }

  static Map<String, dynamic> getMiniPrice(EditAdState state) => {
        'make': state.make!.id,
        'model': state.model!.id,
        'currency': state.currency
      };

  static EditAdState initUserFromApi(UserModel user, EditAdState state) =>
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

  static EditAdState initUserFromState(EditAdState state) => state.copyWith(
      phoneController: TextEditingController(
          text: MyFunctions.phoneFormat(
              state.userModel!.phoneNumber.substring(4))),
      emailController: TextEditingController(text: state.userModel!.email),
      nameController: TextEditingController(text: state.userModel!.fullName),
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

  static Future<EditAdState> stateForEdit(CarSingleEntity v) async {
    String? phone = '';
    try {
      phone = MyFunctions.phoneFormat(v.user.phoneNumber.substring(4));
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      phone = null;
    }
    var gallery = <String>[];
    for (var i = 0; i < v.gallery.length; i++) {
      final path = await MyFunctions.urlToFilePath(v.gallery[i]);
      if (path != null) {
        gallery.add(path);
      }
    }
    log('STATE FOR EDIT : ${v.year}');

    return EditAdState(
      getAnnouncementToEditStatus: FormzStatus.submissionSuccess,
      licenceType: v.licenceType,
      gallery: gallery,
      popStatus: PopStatus.success,
      isContactsVerified: true,
      phoneController: TextEditingController(text: phone ?? v.user.phoneNumber),
      emailController: TextEditingController(text: v.contactEmail),
      nameController: TextEditingController(
          text: v.user.name.isEmpty ? v.user.fullName : v.user.name),
      status: FormzStatus.pure,
      bodyType: BodyTypeEntity(
          logo: v.bodyType.logo ?? '',
          id: v.bodyType.id,
          type: v.bodyType.type),
      callTimeFrom: v.contactAvailableFrom.trim().length > 5
          ? v.contactAvailableFrom.trim().substring(0, 5)
          : null,
      callTimeTo: v.contactAvailableTo.trim().length > 5
          ? v.contactAvailableTo.trim().substring(0, 5)
          : null,
      isCallTimed: v.contactAvailableFrom.isNotEmpty &&
          v.contactAvailableFrom.isNotEmpty,
      colorName: v.color,
      damagedParts: damagedPartAdopter(v.damagedParts),
      currency: v.currency,
      description: v.description,
      driveTypeId: v.driveType.id,
      engineId: v.engineType.id,
      gearbox: v.gearboxType,
      generationEntity: v.generation,
      isWithoutMileage: !(v.distanceTraveled > 0),
      make:
          MakeEntity(id: v.make.id, logo: v.make.logo ?? '', name: v.make.name),
      model: MakeEntity(id: v.model.id, name: v.model.name),
      ownerName: v.user.name.isEmpty ? v.user.fullName : v.user.name,
      ownerPhone: phone ?? v.user.phoneNumber,
      ownerEmail: v.contactEmail,
      ownerStep: v.ownership,
      price: MyFunctions.getThousandsSeparatedPrice(
          v.price.split('.').toList().first),
      mileage: MyFunctions.getThousandsSeparatedPrice('${v.distanceTraveled}'),
      purchasedDate: v.purchaseDate,
      notRegisteredInUzbekistan: v.registeredInUzbekistan,
      yearEntity: YearsEntity(
        id: v.generation.id,
        modelId: v.generation.model,
        yearBegin: v.generation.yearBegin,
        yearEnd: v.generation.yearEnd,
      ),
      modification: v.modificationType,
    );
  }

  static EditAdState choose(EditAdState state, EditAdChooseEvent event) =>
      state.copyWith(
        milageImage: event.milageImage,
        modification: event.modification,
        panaramaGallery: event.panaramaGallery,
        mapPointBytes: event.bodyBytes,
        yearEntity: event.yearEntity,
        locationUrl: event.locationUrl,
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
        generationEntity: event.generationEntity,
        bodyType: event.bodyType,
        model: event.model,
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
        gasBalloonType: event.gasBalloonType,
        districtId: event.districtId,
        phoneController: event.phoneController,
        emailController: event.emailController,
        nameController: event.nameController,
        description: event.description,
      );

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

  static bool nextButtonIsDisabled(int page, EditAdState state) {
    switch (page) {
      // AddPhotoScreen
      case 0:
        // return false;
        return [...state.gallery, ...state.panaramaGallery].isEmpty;
      // PtsScreen
      case 1:
        return state.ownerStep == null ||
            state.licenceType == null ||
            state.purchasedDate == null;
      //  DescriptionScreen
      case 2:
        return false;
      //  EquipmentScreen
      case 3:
        return false;
      // DamageScreen
      case 4:
        return state.damagedParts.isEmpty;
      // ContactsScreen
      case 5:
        return !state.isContactsVerified;
// InspectionPlaceScreen
      case 6:
        return !(state.regionId != null || state.mapPointBytes != null);

      // PriceScreen
      case 7:
        return state.price == null;
      // MileageScreen
      case 8:
        final milage =
            int.tryParse(state.mileage?.replaceAll(' ', '') ?? '0') ?? 0;

        final v = !(milage > 0 ||
            (state.isWithoutMileage ?? false) ||
            state.milageImage != null);
        return v;
      // PreviewScreen
      case 9:
        return false;
    }

    return false;
  }
}