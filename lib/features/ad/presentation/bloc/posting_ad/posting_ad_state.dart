part of 'posting_ad_bloc.dart';

class PostingAdState extends Equatable {
  final String? id;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final int? gearboxId;
  final List<GearboxTypeEntity> gearBoxes;
  final int? driveTypeId;
  final List<DriveTypeEntity> driveTypes;
  final int? engineId;
  final List<EngineTypeEntity> engines;
  final int? modelId;
  final List<MakeEntity> models;
  final int? makeId;
  final List<MakeEntity> makes;
  final List<MakeEntity> topMakes;
  final int? generationId;
  final List<GenerationEntity> generations;
  final int? bodyTypeId;
  final List<BodyTypeEntity> bodyTypes;
  final Region? region;
  final List<Region> regions;
  final List<DistrictEntity> districts;
  final FormzStatus status;
  final FormzStatus getDistrictsStatus;
  final int? yearId;
  final List<YearsEntity>? years;
  final int? districtId;
  final List<String> gallery;
  final List<RentWithPurchaseEntity> rentWithPurchaseConditions;
  final Map<DamagedParts, DamageType> damagedParts;
  final UserModel? userModel;
  final num minimumPrice;
  final int? makeLetterIndex;
  final String? letter;
  final String? ownerName;
  final String? ownerEmail;
  final String? ownerPhone;
  final String? city;
  final String? ownerStep;
  final String? purchasedDate;
  final String? typeDocument;
  final String? colorName;
  final String? description;
  final String? price;
  final String currency;
  final String? mileage;
  final String? gasBalloonType;
  final String? callTimeFrom;
  final String? callTimeTo;
  final String? toastMessage;
  final String? locationUrl;
  final bool hasAppBarShadow;
  final bool isSortByLetter;
  final bool notRegisteredInUzbekistan;
  final bool isCallTimed;
  final bool showOwnerContacts;
  final bool isContactsVerified;
  final bool showExactAddress;
  final bool? rentToBuy;
  final bool? isWithoutMileage;

  const PostingAdState({
    required this.status,
    required this.phoneController,
    required this.emailController,
    required this.nameController,
    this.id,
    this.makeLetterIndex,
    this.minimumPrice = 0,
    this.gearboxId,
    this.gearBoxes = const <GearboxTypeEntity>[],
    this.driveTypeId,
    this.driveTypes = const <DriveTypeEntity>[],
    this.makeId,
    this.makes = const <MakeEntity>[],
    this.engineId,
    this.engines = const <EngineTypeEntity>[],
    this.topMakes = const <MakeEntity>[],
    this.modelId,
    this.models = const <MakeEntity>[],
    this.generationId,
    this.generations = const <GenerationEntity>[],
    this.bodyTypeId,
    this.bodyTypes = const <BodyTypeEntity>[],
    this.yearId,
    this.years = const <YearsEntity>[],
    this.gallery = const <String>[],
    this.rentWithPurchaseConditions = const <RentWithPurchaseEntity>[],
    this.regions = const <Region>[],
    this.damagedParts = const <DamagedParts, DamageType>{},
    this.letter,
    this.colorName,
    this.typeDocument,
    this.ownerStep,
    this.purchasedDate,
    this.description,
    this.isSortByLetter = false,
    this.hasAppBarShadow = true,
    this.notRegisteredInUzbekistan = false,
    this.showExactAddress = false,
    this.ownerName,
    this.ownerEmail,
    this.ownerPhone,
    this.city,
    this.region,
    this.price,
    this.currency = 'usd',
    this.mileage,
    this.gasBalloonType,
    this.callTimeFrom,
    this.callTimeTo,
    this.isCallTimed = false,
    this.showOwnerContacts = false,
    this.isContactsVerified = false,
    this.rentToBuy,
    this.isWithoutMileage,
    this.districtId,
    this.districts = const <DistrictEntity>[],
    this.getDistrictsStatus = FormzStatus.pure,
    this.toastMessage,
    this.userModel,
    this.locationUrl,
  });

  String get districtTitle {
    final index =
        districts.indexWhere((element) => element.id == (districtId ?? -1));
    if (index >= 0) {
      return districts[index].title;
    }
    return 'Выберите район';
  }

  PostingAdState copyWith({
    TextEditingController? phoneController,
    TextEditingController? emailController,
    TextEditingController? nameController,
    Map<DamagedParts, DamageType>? damagedParts,
    List<RentWithPurchaseEntity>? rentWithPurchaseConditions,
    int? districtId,
    Region? region,
    FormzStatus? status,
    FormzStatus? getDistrictsStatus,
    int? gearboxId,
    List<GearboxTypeEntity>? gearBoxes,
    int? driveTypeId,
    List<DriveTypeEntity>? driveTypes,
    int? engineId,
    List<EngineTypeEntity>? engines,
    int? modelId,
    List<MakeEntity>? models,
    int? generationId,
    List<GenerationEntity>? generations,
    int? bodyTypeId,
    List<BodyTypeEntity>? bodyTypes,
    int? makeId,
    List<MakeEntity>? makes,
    List<Region>? regions,
    List<MakeEntity>? topMakes,
    List<DistrictEntity>? districts,
    List<String>? gallery,
    int? yearId,
    List<YearsEntity>? years,
    UserModel? userModel,
    int? eventMakeScrrollIndex,
    num? minimumPrice,
    String? eventLetter,
    String? colorName,
    String? typeDocument,
    String? ownerStep,
    String? ownerName,
    String? ownerPhone,
    String? ownerEmail,
    String? purchasedDate,
    String? description,
    String? city,
    String? price,
    String? currency,
    String? mileage,
    String? gasBalloonType,
    String? callTimeFrom,
    String? callTimeTo,
    String? session,
    String? toastMessage,
    String? locationUrl,
    bool? hasAppBarShadow,
    bool? registeredInUzbekistan,
    bool? isCallTimed,
    bool isSortByLetter = false,
    bool? showOwnerContacts,
    bool? isContactsVerified,
    bool? rentToBuy,
    bool? isWithoutMileage,
    bool? showExactAddress,
  }) {
    // print('====   ACTUALLY IN STATE:  ${this.districts}  ====');
    // print('==== INCOMING DISTRICT TO COPYWITH:  ${districts}  ====');
    final newState = PostingAdState(
      makeLetterIndex: eventMakeScrrollIndex,
      yearId: yearId ?? this.yearId,
      locationUrl: locationUrl ?? this.locationUrl,
      phoneController: phoneController ?? this.phoneController,
      emailController: emailController ?? this.emailController,
      nameController: nameController ?? this.nameController,
      userModel: userModel ?? this.userModel,
      minimumPrice: minimumPrice ?? this.minimumPrice,
      getDistrictsStatus: getDistrictsStatus ?? this.getDistrictsStatus,
      districts: districts ?? this.districts,
      damagedParts: damagedParts ?? this.damagedParts,
      rentWithPurchaseConditions:
          rentWithPurchaseConditions ?? this.rentWithPurchaseConditions,
      showExactAddress: showExactAddress ?? this.showExactAddress,
      districtId: districtId ?? this.districtId,
      city: city ?? this.city,
      region: region ?? this.region,
      gearboxId: gearboxId ?? this.gearboxId,
      gearBoxes: gearBoxes ?? this.gearBoxes,
      driveTypeId: driveTypeId ?? this.driveTypeId,
      driveTypes: driveTypes ?? this.driveTypes,
      engineId: engineId ?? this.engineId,
      engines: engines ?? this.engines,
      models: models ?? this.models,
      generationId: generationId ?? this.generationId,
      generations: generations ?? this.generations,
      bodyTypeId: bodyTypeId ?? this.bodyTypeId,
      topMakes: topMakes ?? this.topMakes,
      makes: makes ?? this.makes,
      status: status ?? this.status,
      bodyTypes: bodyTypes ?? this.bodyTypes,
      years: years ?? this.years,
      hasAppBarShadow: hasAppBarShadow ?? this.hasAppBarShadow,
      isSortByLetter: isSortByLetter,
      modelId: modelId ?? this.modelId,
      makeId: makeId ?? this.makeId,
      letter: eventLetter,
      colorName: colorName ?? this.colorName,
      typeDocument: typeDocument ?? this.typeDocument,
      ownerStep: ownerStep ?? this.ownerStep,
      purchasedDate: purchasedDate ?? this.purchasedDate,
      notRegisteredInUzbekistan:
          registeredInUzbekistan ?? this.notRegisteredInUzbekistan,
      description: description ?? this.description,
      ownerEmail: ownerEmail ?? this.ownerEmail,
      ownerName: ownerName ?? this.ownerName,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      mileage: mileage ?? this.mileage,
      currency: currency ?? this.currency,
      gasBalloonType: gasBalloonType ?? this.gasBalloonType,
      price: price ?? this.price,
      callTimeFrom: callTimeFrom ?? this.callTimeFrom,
      callTimeTo: callTimeTo ?? this.callTimeTo,
      isCallTimed: isCallTimed ?? this.isCallTimed,
      showOwnerContacts: showOwnerContacts ?? this.showOwnerContacts,
      isContactsVerified: isContactsVerified ?? this.isContactsVerified,
      rentToBuy: rentToBuy ?? this.rentToBuy,
      isWithoutMileage: isWithoutMileage ?? this.isWithoutMileage,
      gallery: gallery ?? this.gallery,
      regions: regions ?? this.regions,
      toastMessage: toastMessage ?? this.toastMessage,
    );

    // print(
    //     '====   OUTCOMINT DISTRICT FROM COPY WITH:  ${newState.districts}  ====');
    return newState;
  }

  @override
  List<Object?> get props => [
        id,
        makeLetterIndex,
        locationUrl,
        phoneController,
        emailController,
        nameController,
        userModel,
        toastMessage,
        minimumPrice,
        getDistrictsStatus,
        districts,
        regions,
        damagedParts,
        rentWithPurchaseConditions,
        gallery,
        showExactAddress,
        districtId,
        isWithoutMileage,
        rentToBuy,
        callTimeTo,
        callTimeFrom,
        city,
        region,
        gearboxId,
        gearBoxes,
        driveTypeId,
        driveTypes,
        engineId,
        engines,
        generations,
        modelId,
        isSortByLetter,
        makeId,
        letter,
        hasAppBarShadow,
        years,
        yearId,
        bodyTypes,
        status,
        generationId,
        colorName,
        typeDocument,
        ownerStep,
        purchasedDate,
        bodyTypeId,
        notRegisteredInUzbekistan,
        description,
        ownerEmail,
        ownerName,
        ownerPhone,
        price,
        currency,
        mileage,
        gasBalloonType,
        isCallTimed,
        showOwnerContacts,
        isContactsVerified,
      ];
}
