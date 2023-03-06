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

  final String? id;

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
  final int? engineId;
  final List<EngineTypeEntity> engines;
  final MakeEntity? model;
  final List<MakeEntity> models;
  final MakeEntity? make;
  final List<MakeEntity> makes;
  final List<MakeEntity> topMakes;
  final int? generationId;
  final List<GenerationEntity> generations;
  final BodyTypeEntity? bodyType;
  final List<BodyTypeEntity> bodyTypes;
  final int? regionId;
  final List<RegionEntity> regions;
  final List<DistrictEntity> districts;

  final YearsEntity? yearEntity;
  final List<YearsEntity>? years;
  final int? districtId;
  final List<String> gallery;
  final List<String> panaramaGallery;
  final Map<int, RentWithPurchaseEntity> rentWithPurchaseConditions;

  final Map<DamagedParts, DamageType> damagedParts;
  final Map<int, SO> selectOptions;
  final Map<int, String> radioOptions;

  final UserModel? userModel;
  final Uint8List? mapPointBytes;
  final num minimumPrice;
  final int? makeLetterIndex;
  final int? lastEquipmentId;
  final String? milageImage;
  final String? letter;
  final String? ownerName;
  final String? ownerEmail;
  final String? ownerPhone;
  final String? city;
  final String? ownerStep;
  final String? purchasedDate;
  final String? licenceType;
  final String? colorName;
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
    this.id,
    this.makeLetterIndex,
    this.minimumPrice = 0,
    this.modification,
    this.modifications = const <ModificationTypeEntity>[],
    this.gearbox,
    this.gearBoxes = const <GearboxTypeEntity>[],
    this.driveTypeId,
    this.driveTypes = const <DriveTypeEntity>[],
    this.make,
    this.makes = const <MakeEntity>[],
    this.engineId,
    this.engines = const <EngineTypeEntity>[],
    this.topMakes = const <MakeEntity>[],
    this.model,
    this.models = const <MakeEntity>[],
    this.generationId,
    this.generations = const <GenerationEntity>[],
    this.bodyType,
    this.bodyTypes = const <BodyTypeEntity>[],
    this.yearEntity,
    this.years = const <YearsEntity>[],
    this.gallery = const <String>[],
    this.panaramaGallery = const <String>[],
    this.rentWithPurchaseConditions = const <int, RentWithPurchaseEntity>{},
    this.regions = const <RegionEntity>[],
    this.damagedParts = const <DamagedParts, DamageType>{},
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
    this.ownerName,
    this.ownerEmail,
    this.ownerPhone,
    this.city,
    this.regionId,
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
    this.districtId,
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

  String? get districtTitle {
    final index =
        districts.indexWhere((element) => element.id == (districtId ?? -1));
    if (index >= 0) {
      return districts[index].title;
    }
    return null;
  }

  PostingAdState copyWith({
    TextEditingController? phoneController,
    TextEditingController? emailController,
    TextEditingController? nameController,
    TextEditingController? searchController,
    Map<int, SO>? selectOptions,
    Map<int, String>? radioOptions,
    int? lastEquipmentId,
    Map<DamagedParts, DamageType>? damagedParts,
    Map<int, RentWithPurchaseEntity>? rentWithPurchaseConditions,
    int? districtId,
    int? regionId,
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
    int? engineId,
    List<EngineTypeEntity>? engines,
    MakeEntity? model,
    List<MakeEntity>? models,
    int? generationId,
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
    YearsEntity? yearEntity,
    List<YearsEntity>? years,
    UserModel? userModel,
    int? eventMakeScrrollIndex,
    num? minimumPrice,
    String? milageImage,
    String? eventLetter,
    String? colorName,
    String? licenceType,
    String? ownerStep,
    String? ownerName,
    Uint8List? mapPointBytes,
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
    GlobalKey<FormState>? contactsFormKey,
    List<GasEquipmentEntity>? gasEquipments,
    int? gasEquipmentId,
    List<EquipmentEntity>? equipments,
    EquipmentEntity? equipment,
    List<EquipmentOptionsListEntity>? equipmentOptionsList,

    bool isEquipmentToNull = false,
    bool isLastEquipmentIdToNull = false,
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
        yearEntity: yearEntity ?? this.yearEntity,
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
        regionId: regionId ?? this.regionId,
        gearbox: gearbox ?? this.gearbox,
        gearBoxes: gearBoxes ?? this.gearBoxes,
        driveTypeId: driveTypeId ?? this.driveTypeId,
        driveTypes: driveTypes ?? this.driveTypes,
        engineId: engineId ?? this.engineId,
        engines: engines ?? this.engines,
        models: models ?? this.models,
        generationId: generationId ?? this.generationId,
        generations: generations ?? this.generations,
        bodyType: bodyType ?? this.bodyType,
        topMakes: topMakes ?? this.topMakes,
        makes: makes ?? this.makes,
        status: status ?? this.status,
        bodyTypes: bodyTypes ?? this.bodyTypes,
        years: years ?? this.years,
        hasAppBarShadow: hasAppBarShadow ?? this.hasAppBarShadow,
        isSortByLetter: isSortByLetter,
        model: model ?? this.model,
        make: make ?? this.make,
        letter: eventLetter,
        colorName: colorName ?? this.colorName,
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
        gasEquipmentId: gasEquipmentId ?? this.gasEquipmentId,
        equipments: equipments ?? this.equipments,
        equipment: isEquipmentToNull ? null : equipment ?? this.equipment,
        equipmentOptionsList: equipmentOptionsList ?? this.equipmentOptionsList,
        getModificationStatus:
            getModificationStatus ?? this.getModificationStatus,
      );

  @override
  List<Object?> get props => [
        getLocationImage,
        lastEquipmentId,
        selectOptions,
        radioOptions,
        contactsFormKey,
        popStatus,
        milageImage,
        modification,
        modifications,
        getMakesStatus,
        searchController,
        panaramaGallery,
        createStatus,
        mapPointBytes,
        id,
        makeLetterIndex,
        long,
        lat,
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
        regionId,
        gearbox,
        gearBoxes,
        driveTypeId,
        driveTypes,
        engineId,
        engines,
        generations,
        model,
        isSortByLetter,
        make,
        letter,
        hasAppBarShadow,
        years,
        yearEntity,
        bodyTypes,
        status,
        generationId,
        colorName,
        licenceType,
        ownerStep,
        purchasedDate,
        bodyType,
        notRegisteredInUzbekistan,
        description,
        ownerEmail,
        ownerName,
        ownerPhone,
        price,
        currency,
        mileage,
        isCallTimed,
        showOwnerContacts,
        isContactsVerified,
        gasEquipments,
        gasEquipmentId,
        equipments,
        equipment,
        equipmentOptionsList,
        getModificationStatus,
      ];

  bool isOptionSelected({required String type, required int id}) {
    if (type == 'select') {
      final v = selectOptions.containsKey(id);
      return v;
    }
    final v = radioOptions.containsKey(id);
    return v;
  }

  bool buttonStatus(int page) => PASingleton.nextButtonIsDisabled(page, this);

  RegionEntity get getSelectedRegion {
    RegionEntity? v;
    try {
      return regions.firstWhere((e) => e.id == regionId);
    } catch (e) {
      return const RegionEntity();
    }
  }
}

class SO extends Equatable {
  final int id;
  final String optionName;

  const SO({required this.id, required this.optionName});

  @override
  List<Object?> get props => [id, optionName];
}
