part of 'posting_ad_bloc.dart';

class PostingAdState extends Equatable {
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
  final YearsEntity? yearsEntity;
  final DistrictEntity? district;
  final List<String> gallery;
  final List<RentWithPurchaseEntity> rentWithPurchaseConditions;
  final Map<DamagedParts, DamageType> damagedParts;

  final String? letter;
  final String? ownerName;
  final String? ownerEmail;
  final String? ownerPhone;
  final String? city;
  final String? ownerStep;
  final String? purchasedDate;
  final String? typeDocument;
  final String? colorName;
  final String? descriptions;
  final String? price;
  final String? currency;
  final String? mileage;
  final String? gasBalloonType;
  final String? callTimeFrom;
  final String? callTimeTo;
  final bool hasAppBarShadow;
  final bool isSortByLetter;
  final bool registeredInUzbekistan;
  final bool isCallTimed;
  final bool showOwnerContacts;
  final bool isContactsVerified;
  final bool showExactAddress;
  final bool? rentToBuy;
  final bool? isWithoutMileage;

  const PostingAdState({
    required this.status,
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
    this.gallery = const <String>[],
    this.rentWithPurchaseConditions = const <RentWithPurchaseEntity>[],
    this.regions = const <Region>[],
    this.damagedParts = const <DamagedParts, DamageType>{},
    this.yearsEntity,
    this.letter,
    this.colorName,
    this.typeDocument,
    this.ownerStep,
    this.purchasedDate,
    this.descriptions,
    this.isSortByLetter = false,
    this.hasAppBarShadow = true,
    this.registeredInUzbekistan = false,
    this.showExactAddress = false,
    this.ownerName,
    this.ownerEmail,
    this.ownerPhone,
    this.city,
    this.region,
    this.price,
    this.currency,
    this.mileage,
    this.gasBalloonType,
    this.callTimeFrom,
    this.callTimeTo,
    this.isCallTimed = false,
    this.showOwnerContacts = false,
    this.isContactsVerified = false,
    this.rentToBuy,
    this.isWithoutMileage,
    this.district,
    this.districts = const <DistrictEntity>[],
    this.getDistrictsStatus = FormzStatus.pure,
  });
  PostingAdState copyWith({
    Map<DamagedParts, DamageType>? damagedParts,
    List<RentWithPurchaseEntity>? rentWithPurchaseConditions,
    DistrictEntity? district,
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
    YearsEntity? yearsEntity,
    String? letter,
    String? colorName,
    String? typeDocument,
    String? ownerStep,
    String? ownerName,
    String? ownerPhone,
    String? ownerEmail,
    String? purchasedDate,
    String? descriptions,
    String? city,
    String? price,
    String? currency,
    String? mileage,
    String? gasBalloonType,
    String? callTimeFrom,
    String? callTimeTo,
    String? session,
    bool? hasAppBarShadow,
    bool? registeredInUzbekistan,
    bool? isCallTimed,
    bool isSortByLetter = false,
    bool? showOwnerContacts,
    bool? isContactsVerified,
    bool? rentToBuy,
    bool? isWithoutMileage,
    bool? showExactAddress,
  }) => PostingAdState(
      getDistrictsStatus: getDistrictsStatus ?? this.getDistrictsStatus,
      districts: districts ?? this.districts,
      damagedParts: damagedParts ?? this.damagedParts,
      rentWithPurchaseConditions:
          rentWithPurchaseConditions ?? this.rentWithPurchaseConditions,
      showExactAddress: showExactAddress ?? this.showExactAddress,
      district: district ?? this.district,
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
      yearsEntity: yearsEntity ?? this.yearsEntity,
      hasAppBarShadow: hasAppBarShadow ?? this.hasAppBarShadow,
      isSortByLetter: isSortByLetter,
      modelId: modelId ?? this.modelId,
      makeId: makeId ?? this.makeId,
      letter: letter,
      colorName: colorName ?? this.colorName,
      typeDocument: typeDocument ?? this.typeDocument,
      ownerStep: ownerStep ?? this.ownerStep,
      purchasedDate: purchasedDate ?? this.purchasedDate,
      registeredInUzbekistan:
          registeredInUzbekistan ?? this.registeredInUzbekistan,
      descriptions: descriptions ?? this.descriptions,
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
    );

  @override
  List<Object?> get props => [
        getDistrictsStatus,
        districts,
        regions,
        damagedParts,
        rentWithPurchaseConditions,
        gallery,
        showExactAddress,
        district,
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
        yearsEntity,
        bodyTypes,
        status,
        generationId,
        colorName,
        typeDocument,
        ownerStep,
        purchasedDate,
        bodyTypeId,
        registeredInUzbekistan,
        descriptions,
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
