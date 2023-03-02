part of 'edit_ad_bloc.dart';

class EditAdState extends Equatable {
  final PopStatus popStatus;
  final FormzStatus status;
  final FormzStatus getDistrictsStatus;
  final FormzStatus createStatus;

  final FormzStatus getAnnouncementToEditStatus;
  final String? id;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final ModificationTypeEntity? modification;
  final GearboxTypeEntity? gearbox;
  final int? driveTypeId;
  final int? engineId;
  final MakeEntity? model;
  final MakeEntity? make;
  final CarGenerationEntity? generationEntity;
  final BodyTypeEntity? bodyType;
  final RegionEntity? region;
  final List<RegionEntity> regions;
  final List<DistrictEntity> districts;

  final YearsEntity? yearEntity;
  final DistrictEntity? district;
  final List<String> gallery;
  final List<String> panaramaGallery;
  final Map<int, RentWithPurchaseEntity> rentWithPurchaseConditions;
  final Map<DamagedParts, DamageType> damagedParts;
  final UserModel? userModel;
  final Uint8List? mapPointBytes;
  final num minimumPrice;
  final String? milageImage;
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
  final String? locationUrl;
  final bool notRegisteredInUzbekistan;
  final bool isCallTimed;
  final bool showOwnerContacts;
  final bool isContactsVerified;
  final bool showExactAddress;
  final bool? rentToBuy;
  final bool? isWithoutMileage;
  final List<EquipmentEntity> equipments;
  final int? equipmentId;

  const EditAdState({
    required this.status,
    required this.getAnnouncementToEditStatus,
    required this.phoneController,
    required this.emailController,
    required this.nameController,
    required this.popStatus,
    this.id,
    this.minimumPrice = 0,
    this.modification,
    this.gearbox,
    this.driveTypeId,
    this.make,
    this.engineId,
    this.model,
    this.generationEntity,
    this.bodyType,
    this.yearEntity,
    this.gallery = const <String>[],
    this.panaramaGallery = const <String>[],
    this.rentWithPurchaseConditions = const <int, RentWithPurchaseEntity>{},
    this.regions = const <RegionEntity>[],
    this.damagedParts = const <DamagedParts, DamageType>{},
    this.colorName,
    this.licenceType,
    this.ownerStep,
    this.purchasedDate,
    this.description,
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
    this.toastMessage,
    this.userModel,
    this.locationUrl,
    this.mapPointBytes,
    this.milageImage,
    this.equipments = const [],
    this.equipmentId,
  });


  EditAdState copyWith({
    TextEditingController? phoneController,
    TextEditingController? emailController,
    TextEditingController? nameController,
    Map<DamagedParts, DamageType>? damagedParts,
    Map<int, RentWithPurchaseEntity>? rentWithPurchaseConditions,
    DistrictEntity? district,
    RegionEntity? region,
    FormzStatus? status,
    FormzStatus? getDistrictsStatus,
    FormzStatus? createStatus,
    FormzStatus? getAnnouncementToEditStatus,
    PopStatus? popStatus,
    ModificationTypeEntity? modification,
    GearboxTypeEntity? gearbox,
    int? driveTypeId,
    int? engineId,
    MakeEntity? model,
    CarGenerationEntity? generationEntity,
    BodyTypeEntity? bodyType,
    MakeEntity? make,
    List<RegionEntity>? regions,
    List<DistrictEntity>? districts,
    List<String>? gallery,
    List<String>? panaramaGallery,
    YearsEntity? yearEntity,
    UserModel? userModel,
    num? minimumPrice,
    String? milageImage,
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
    String? locationUrl,
    bool? hasAppBarShadow,
    bool? notRegisteredInUzbekistan,
    bool? isCallTimed,
    bool? showOwnerContacts,
    bool? isContactsVerified,
    bool? rentToBuy,
    bool? isWithoutMileage,
    bool? showExactAddress,
    List<EquipmentEntity>? equipments,
    int? equipmentId,
  }) =>
      EditAdState(
        getAnnouncementToEditStatus:
            getAnnouncementToEditStatus ?? this.getAnnouncementToEditStatus,
        popStatus: popStatus ?? this.popStatus,
        milageImage: milageImage ?? this.milageImage,
        modification: modification ?? this.modification,
        panaramaGallery: panaramaGallery ?? this.panaramaGallery,
        createStatus: createStatus ?? this.createStatus,
        mapPointBytes: mapPointBytes ?? this.mapPointBytes,
        yearEntity: yearEntity ?? this.yearEntity,
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
        district: district ?? this.district,
        city: city ?? this.city,
        region: region ?? this.region,
        gearbox: gearbox ?? this.gearbox,
        driveTypeId: driveTypeId ?? this.driveTypeId,
        engineId: engineId ?? this.engineId,
        generationEntity: generationEntity ?? this.generationEntity,
        bodyType: bodyType ?? this.bodyType,
        status: status ?? this.status,
        model: model ?? this.model,
        make: make ?? this.make,
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
        equipments: equipments ?? this.equipments,
        equipmentId: equipmentId ?? this.equipmentId,
      );

  @override
  List<Object?> get props => [
        getAnnouncementToEditStatus,
        popStatus,
        milageImage,
        modification,
        panaramaGallery,
        createStatus,
        mapPointBytes,
        id,
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
        district,
        isWithoutMileage,
        rentToBuy,
        callTimeTo,
        callTimeFrom,
        city,
        region,
        gearbox,
        driveTypeId,
        engineId,
        model,
        make,
        yearEntity,
        status,
        generationEntity,
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
        equipments,
        equipmentId,
      ];

  bool buttonStatus(int page) => EASingleton.nextButtonIsDisabled(page, this);

}
