part of 'posting_ad_bloc.dart';

class PostingAdState extends Equatable {
  final PopStatus popStatus;
  final FormzStatus status;
  final FormzStatus getDistrictsStatus;
  final FormzStatus getMakesStatus;
  final FormzStatus createStatus;
  final FormzStatus getModificationStatus;
  final FormzStatus getLocationImage;
  final GlobalKey<FormState> contactsFormKey;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController searchController;
  final ModificationTypeEntity? modification;
  final List<ModificationTypeEntity> modifications;
  final GearboxTypeEntity? gearbox;
  final List<GearboxTypeEntity> gearBoxes;
  final int? driveTypeId;
  final List<DriveTypeEntity> driveTypes;
  final EngineTypeEntity? engine;
  final List<EngineTypeEntity> engines;
  final MakeEntity? model;
  final List<MakeEntity> models;
  final MakeEntity? make;
  final List<MakeEntity> makes;
  final List<MakeEntity> topMakes;
  final GenerationEntity? generation;
  final List<GenerationEntity> generations;
  final BodyTypeEntity? bodyType;
  final List<BodyTypeEntity> bodyTypes;
  final RegionEntity? region;
  final List<RegionEntity> regions;
  final List<DistrictEntity> districts;
  final int? selectedYear;
  final YearsEntity? yearEntity;
  final DistrictEntity? district;
  final List<String> gallery;
  final List<String> panaramaGallery;
  final Map<int, RentWithPurchaseEntity> rentWithPurchaseConditions;
  final List<ColorEntity> colors;
  final Map<DamagedPart, DamageType> damagedParts;
  final Map<int, SO> selectOptions;
  final Map<int, String> radioOptions;
  final UserModel? userModel;
  final Uint8List? mapPointBytes;
  final num minimumPrice;
  final int? makeLetterIndex;
  final int? lastEquipmentId;
  final String? nextMakes;
  final String? nextModels;
  final String? milageImage;
  final String? letter;
  final String? ownerName;
  final String? ownerEmail;
  final String? ownerPhone;
  final String? city;
  final String? ownerStep;
  final String? purchasedDate;
  final String? licenceType;
  final ColorEntity? colorName;
  final String? description;
  final String? price;
  final String currency;
  final String? mileage;
  final String? callTimeFrom;
  final String? callTimeTo;
  final String? toastMessage;
  final double? long;
  final double? lat;
  final bool hasAppBarShadow;
  final bool isSortByLetter;
  final bool notRegisteredInUzbekistan;
  final bool isCallTimed;
  final bool showOwnerContacts;
  final bool isContactsVerified;
  final bool showExactAddress;
  final bool? rentToBuy;
  final bool? isWithoutMileage;
  final int? gasEquipmentId;
  final List<GasEquipmentEntity> gasEquipments;
  final EquipmentEntity? equipment;
  final List<EquipmentEntity> equipments;
  final List<EquipmentOptionsListEntity> equipmentOptionsList;

  const PostingAdState({
    required this.contactsFormKey,
    required this.status,
    required this.searchController,
    required this.phoneController,
    required this.emailController,
    required this.nameController,
    required this.popStatus,
    this.radioOptions = const <int, String>{},
    this.selectOptions = const <int, SO>{},
    this.lastEquipmentId,
    this.colors = const <ColorEntity>[],
    this.makeLetterIndex,
    this.minimumPrice = 0,
    this.modification,
    this.modifications = const <ModificationTypeEntity>[],
    this.gearbox,
    this.gearBoxes = const <GearboxTypeEntity>[],
    this.driveTypeId,
    this.driveTypes = const <DriveTypeEntity>[],
    this.nextMakes,
    this.nextModels,
    this.make,
    this.makes = const <MakeEntity>[],
    this.engine,
    this.engines = const <EngineTypeEntity>[],
    this.topMakes = const <MakeEntity>[],
    this.model,
    this.models = const <MakeEntity>[],
    this.generation,
    this.generations = const <GenerationEntity>[],
    this.bodyType,
    this.bodyTypes = const <BodyTypeEntity>[],
    this.selectedYear,
    this.yearEntity = const YearsEntity(),
    this.gallery = const <String>[],
    this.panaramaGallery = const <String>[],
    this.rentWithPurchaseConditions = const <int, RentWithPurchaseEntity>{},
    this.regions = const <RegionEntity>[],
    this.damagedParts = const <DamagedPart, DamageType>{},
    this.letter,
    this.colorName,
    this.licenceType,
    this.ownerStep,
    this.purchasedDate,
    this.description,
    this.isSortByLetter = false,
    this.hasAppBarShadow = true,
    this.notRegisteredInUzbekistan = false,
    this.showExactAddress = false,
    this.ownerEmail,
    this.ownerName,
    this.ownerPhone,
    this.city,
    this.region,
    this.price,
    this.currency = 'uzs',
    this.mileage,
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
    this.createStatus = FormzStatus.pure,
    this.getMakesStatus = FormzStatus.pure,
    this.getModificationStatus = FormzStatus.pure,
    this.getLocationImage = FormzStatus.pure,
    this.toastMessage,
    this.userModel,
    this.lat,
    this.long,
    this.mapPointBytes,
    this.milageImage,
    this.gasEquipments = const [],
    this.gasEquipmentId,
    this.equipments = const [],
    this.equipment,
    this.equipmentOptionsList = const [],
  });

  PostingAdState copyWith({
    TextEditingController? phoneController,
    TextEditingController? emailController,
    TextEditingController? nameController,
    TextEditingController? searchController,
    Map<int, SO>? selectOptions,
    Map<int, String>? radioOptions,
    int? lastEquipmentId,
    Map<DamagedPart, DamageType>? damagedParts,
    Map<int, RentWithPurchaseEntity>? rentWithPurchaseConditions,
    DistrictEntity? district,
    RegionEntity? region,
    FormzStatus? status,
    FormzStatus? getDistrictsStatus,
    FormzStatus? createStatus,
    FormzStatus? getMakesStatus,
    FormzStatus? getModificationStatus,
    FormzStatus? getLocationImage,
    PopStatus? popStatus,
    ModificationTypeEntity? modification,
    List<ModificationTypeEntity>? modifications,
    GearboxTypeEntity? gearbox,
    List<GearboxTypeEntity>? gearBoxes,
    int? driveTypeId,
    List<DriveTypeEntity>? driveTypes,
    EngineTypeEntity? engine,
    List<EngineTypeEntity>? engines,
    MakeEntity? model,
    List<MakeEntity>? models,
    GenerationEntity? generation,
    List<GenerationEntity>? generations,
    BodyTypeEntity? bodyType,
    List<BodyTypeEntity>? bodyTypes,
    MakeEntity? make,
    List<MakeEntity>? makes,
    List<RegionEntity>? regions,
    List<MakeEntity>? topMakes,
    List<DistrictEntity>? districts,
    List<String>? gallery,
    List<String>? panaramaGallery,
    Uint8List? mapPointBytes,
    YearsEntity? yearEntity,
    int? selectedYear,
    UserModel? userModel,
    int? eventMakeScrrollIndex,
    num? minimumPrice,
    ColorEntity? colorName,
    List<ColorEntity>? colors,
    String? eventLetter,
    String? licenceType,
    String? milageImage,
    String? ownerStep,
    String? ownerName,
    String? ownerPhone,
    String? ownerEmail,
    String? nextMakes,
    String? nextModels,
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
    double? long,
    double? lat,
    bool? hasAppBarShadow,
    bool? notRegisteredInUzbekistan,
    bool? isCallTimed,
    bool isSortByLetter = false,
    bool? showOwnerContacts,
    bool? isContactsVerified,
    bool? rentToBuy,
    bool? isWithoutMileage,
    bool? showExactAddress,
    bool isLastEquipmentIdToNull = false,
    bool isGasEquipmentsToNull = false,
    bool isEquipmentToNull = false,
    GlobalKey<FormState>? contactsFormKey,
    List<GasEquipmentEntity>? gasEquipments,
    int? gasEquipmentId,
    List<EquipmentEntity>? equipments,
    EquipmentEntity? equipment,
    List<EquipmentOptionsListEntity>? equipmentOptionsList,
  }) =>
      PostingAdState(
        getLocationImage: getLocationImage ?? this.getLocationImage,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        lastEquipmentId: isLastEquipmentIdToNull
            ? null
            : lastEquipmentId ?? this.lastEquipmentId,
        selectOptions: selectOptions ?? this.selectOptions,
        radioOptions: radioOptions ?? this.radioOptions,
        contactsFormKey: contactsFormKey ?? this.contactsFormKey,
        popStatus: popStatus ?? this.popStatus,
        milageImage: milageImage ?? this.milageImage,
        modification: modification ?? this.modification,
        modifications: modifications ?? this.modifications,
        getMakesStatus: getMakesStatus ?? this.getMakesStatus,
        searchController: searchController ?? this.searchController,
        panaramaGallery: panaramaGallery ?? this.panaramaGallery,
        createStatus: createStatus ?? this.createStatus,
        mapPointBytes: mapPointBytes ?? this.mapPointBytes,
        makeLetterIndex: eventMakeScrrollIndex,
        selectedYear: selectedYear ?? this.selectedYear,
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
        district: district?.id == -1 ? null : district ?? this.district,
        city: city ?? this.city,
        region: region ?? this.region,
        gearbox: gearbox ?? this.gearbox,
        gearBoxes: gearBoxes ?? this.gearBoxes,
        driveTypeId: driveTypeId ?? this.driveTypeId,
        driveTypes: driveTypes ?? this.driveTypes,
        engine: engine ?? this.engine,
        engines: engines ?? this.engines,
        models: models ?? this.models,
        generation: generation ?? this.generation,
        generations: generations ?? this.generations,
        bodyType: bodyType ?? this.bodyType,
        topMakes: topMakes ?? this.topMakes,
        makes: makes ?? this.makes,
        status: status ?? this.status,
        bodyTypes: bodyTypes ?? this.bodyTypes,
        yearEntity: yearEntity ?? this.yearEntity,
        hasAppBarShadow: hasAppBarShadow ?? this.hasAppBarShadow,
        isSortByLetter: isSortByLetter,
        model: model ?? this.model,
        nextModels: returnNullIfEmpty(nextModels, this.nextModels),
        nextMakes: returnNullIfEmpty(nextMakes, this.nextMakes),
        make: make ?? this.make,
        letter: eventLetter,
        colorName: colorName ?? this.colorName,
        colors: colors ?? this.colors,
        licenceType: licenceType ?? this.licenceType,
        ownerStep: ownerStep ?? this.ownerStep,
        purchasedDate: purchasedDate ?? this.purchasedDate,
        notRegisteredInUzbekistan:
            notRegisteredInUzbekistan ?? this.notRegisteredInUzbekistan,
        description: description ?? this.description,
        ownerEmail: ownerEmail ?? this.ownerEmail,
        ownerName: ownerName ?? this.ownerName,
        ownerPhone: ownerPhone ?? this.ownerPhone,
        mileage: mileage ?? this.mileage,
        currency: currency ?? this.currency,
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
        toastMessage: toastMessage,
        gasEquipments: gasEquipments ?? this.gasEquipments,
        gasEquipmentId: isGasEquipmentsToNull
            ? null
            : gasEquipmentId ?? this.gasEquipmentId,
        equipments: equipments ?? this.equipments,
        equipment: isEquipmentToNull ? null : equipment ?? this.equipment,
        equipmentOptionsList: equipmentOptionsList ?? this.equipmentOptionsList,
        getModificationStatus:
            getModificationStatus ?? this.getModificationStatus,
      );

  @override
  List<Object?> get props => [
        popStatus,
        status,
        getDistrictsStatus,
        getMakesStatus,
        createStatus,
        getModificationStatus,
        getLocationImage,
        contactsFormKey,
        phoneController,
        emailController,
        nameController,
        searchController,
        modification,
        modifications,
        gearbox,
        gearBoxes,
        driveTypeId,
        driveTypes,
        engine,
        engines,
        model,
        models,
        make,
        makes,
        topMakes,
        generation,
        generations,
        bodyType,
        bodyTypes,
        region,
        regions,
        districts,
        selectedYear,
        yearEntity,
        district,
        gallery,
        panaramaGallery,
        rentWithPurchaseConditions,
        colors,
        damagedParts,
        selectOptions,
        radioOptions,
        userModel,
        mapPointBytes,
        minimumPrice,
        makeLetterIndex,
        lastEquipmentId,
        nextMakes,
        nextModels,
        milageImage,
        letter,
        ownerName,
        ownerEmail,
        ownerPhone,
        city,
        ownerStep,
        purchasedDate,
        licenceType,
        colorName,
        description,
        price,
        currency,
        mileage,
        callTimeFrom,
        callTimeTo,
        toastMessage,
        long,
        lat,
        hasAppBarShadow,
        isSortByLetter,
        notRegisteredInUzbekistan,
        isCallTimed,
        showOwnerContacts,
        isContactsVerified,
        showExactAddress,
        rentToBuy,
        isWithoutMileage,
        gasEquipmentId,
        gasEquipments,
        equipment,
        equipments,
        equipmentOptionsList,
      ];

  String? returnNullIfEmpty(String? v, String? origin) => v == null
      ? origin
      : v.isEmpty
          ? null
          : v;

  bool isOptionSelected({required String type, required int id}) {
    if (type == 'select') {
      final v = selectOptions.containsKey(id);
      return v;
    }
    final v = radioOptions.containsKey(id);
    return v;
  }

  bool buttonStatus(int page) => PASingleton.nextButtonIsDisabled(page, this);
}

class SO extends Equatable {
  final int id;
  final String optionName;

  const SO({required this.id, required this.optionName});

  @override
  List<Object?> get props => [id, optionName];
}
