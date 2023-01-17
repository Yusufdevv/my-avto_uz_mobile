part of 'posting_ad_bloc.dart';

class PostingAdState extends Equatable {
  final Region? region;
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
  final FormzStatus status;
  final YearsEntity? yearsEntity;
  final String? letter;
  final String? ownerName;
  final String? ownerEmail;
  final String? ownerPhone;
  final String? city;
  final String? ownerStep;
  final String? boughtTime;
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
  final bool isRastamojen;
  final bool isCallTimed;
  final bool? showOwnerContacts;
  final bool? isContactsVerified;
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
    this.yearsEntity,
    this.letter,
    this.colorName,
    this.typeDocument,
    this.ownerStep,
    this.boughtTime,
    this.descriptions,
    this.isSortByLetter = false,
    this.hasAppBarShadow = true,
    this.isRastamojen = false,
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
    this.showOwnerContacts,
    this.isContactsVerified,
    this.rentToBuy,
    this.isWithoutMileage,
  });
  PostingAdState copyWith({
    Region? region,
    FormzStatus? status,
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
    List<MakeEntity>? topMakes,
    YearsEntity? yearsEntity,
    String? letter,
    String? colorName,
    String? typeDocument,
    String? ownerStep,
    String? ownerName,
    String? ownerPhone,
    String? ownerEmail,
    String? boughtTime,
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
    bool? isRastamojen,
    bool? isCallTimed,
    bool isSortByLetter = false,
    bool? showOwnerContacts,
    bool? isContactsVerified,
    bool? rentToBuy,
    bool? isWithoutMileage,
  }) =>
      PostingAdState(
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
        boughtTime: boughtTime ?? this.boughtTime,
        isRastamojen: isRastamojen ?? this.isRastamojen,
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
      );
  @override
  List<Object?> get props => [
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
        boughtTime,
        bodyTypeId,
        isRastamojen,
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
