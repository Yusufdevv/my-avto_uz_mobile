part of 'posting_ad_bloc.dart';

abstract class PostingAdEvent {}

class PostingAdShowToastEvent extends PostingAdEvent {
  final String message;
  final PopStatus status;

  PostingAdShowToastEvent({required this.message, required this.status});
}

class PostingAdSerchControllerClearEvent extends PostingAdEvent {}

class PostingAdClearStateEvent extends PostingAdEvent {}

class PostingAdModificationsEvent extends PostingAdEvent {
  final String? name;

  PostingAdModificationsEvent({this.name});
}

class PostingAdAddEventForEveryPage extends PostingAdEvent {
  final int page;

  PostingAdAddEventForEveryPage({required this.page});
}

class PostingAdGetMapScreenShotEvent extends PostingAdEvent {
  final double lat;
  final double long;
  final double zoomLevel;

  PostingAdGetMapScreenShotEvent(
      {required this.lat, required this.long, required this.zoomLevel});
}

class PostingAdGetYearsEvent extends PostingAdEvent {}

class PostingAdClearControllersEvent extends PostingAdEvent {}

class PostingAdGetUserDataEvent extends PostingAdEvent {}

class PostingAdSendCodeEvent extends PostingAdEvent {
  final String phone;
  final Function(String) onSuccess;

  PostingAdSendCodeEvent({required this.phone, required this.onSuccess});
}

class PostingAdGetMinimumPriceEvent extends PostingAdEvent {}

class PostingAdDamageEvent extends PostingAdEvent {
  final DamagedParts part;
  final DamageType type;

  PostingAdDamageEvent({required this.part, required this.type});
}

class PostingAdGetRegionsEvent extends PostingAdEvent {}

class PostingAdGetDistritsEvent extends PostingAdEvent {
  final int? regionId;

  PostingAdGetDistritsEvent({this.regionId});
}



class PostingAdCreateEvent extends PostingAdEvent {}

class PostingAdBodyTypesEvent extends PostingAdEvent {}

class PostingAdGearBoxesEvent extends PostingAdEvent {}

class PostingAdModelEvent extends PostingAdEvent {
  final String? name;

  PostingAdModelEvent({this.name});
}

class PostingAdDriveTypesEvent extends PostingAdEvent {
  PostingAdDriveTypesEvent();
}

class PostingAdEnginesEvent extends PostingAdEvent {
  PostingAdEnginesEvent();
}

class PostingAdSearchMakesEvent extends PostingAdEvent {
  final String? name;

  PostingAdSearchMakesEvent({this.name});
}

class PostingAdMakesEvent extends PostingAdEvent {
  PostingAdMakesEvent();
}

class PostingAdTopMakesEvent extends PostingAdEvent {
  final String? name;

  PostingAdTopMakesEvent({this.name});
}

class PostingAdOnRentWithPurchaseConditionChangedEvent extends PostingAdEvent {
  final RentWithPurchaseEntity condition;

  PostingAdOnRentWithPurchaseConditionChangedEvent({required this.condition});
}

class PostingAdGenerationsEvent extends PostingAdEvent {
  final int modelId;

  PostingAdGenerationsEvent({required this.modelId});
}

class PostingAdChooseEvent extends PostingAdEvent {
  final TextEditingController? phoneController;
  final TextEditingController? emailController;
  final TextEditingController? nameController;
  final TextEditingController? searchController;
  final List<String>? gallery;
  final List<String>? panaramaGallery;
  final int? regionId;
  final List<YearsEntity>? years;
  final int? districtId;

  final Map<DamagedParts, DamageType>? damagedParts;
  final ModificationTypeEntity? modification;
  final MakeEntity? model;
  final int? generationId;

  final int? popularTypeId;
  final MakeEntity? make;
  final int? engineId;
  final BodyTypeEntity? bodyType;
  final int? driveTypeId;
  final GearboxTypeEntity? gearbox;
  final YearsEntity? yearEntity;
  final Uint8List? bodyBytes;
  final String? milageImage;
  final String? letter;
  final String? colorName;
  final String? typeDocument;
  final String? ownerStep;
  final String? ownerEmail;
  final String? ownerPhone;
  final String? ownerName;
  final String? purchasedDate;
  final String? description;
  final String? city;
  final String? price;
  final String? currency;
  final String? mileage;

  final String? callTimeFrom;
  final String? callTimeTo;
  final String? where;
  final String? toastMessage;
  final String? locationUrll;

  final bool? hasGasBalloon;
  final bool? isRastamojen;
  final bool? isCallTimed;
  final bool? showOwnerContacts;
  final bool? isContactsVerified;
  final bool? rentToBuy;
  final bool? isWithoutMileage;
  final bool? showExactAddress;
  final bool? isNew;
  final bool? isEquipmentToNull;
  final int? gasEquipmentId;
  final FormzStatus? getModificationStatus;
  final FormzStatus? createStatus;

  PostingAdChooseEvent({
    this.isEquipmentToNull,
    this.createStatus,
    this.modification,
    this.searchController,
    this.panaramaGallery,
    this.bodyBytes,
    this.yearEntity,
    this.locationUrll,
    this.phoneController,
    this.emailController,
    this.nameController,
    this.toastMessage,
    this.where,
    this.damagedParts,
    this.isNew,
    this.gallery,
    this.showExactAddress,
    this.districtId,
    this.driveTypeId,
    this.generationId,
    this.bodyType,
    this.years,
    this.model,
    this.letter,
    this.make,
    this.popularTypeId,
    this.engineId,
    this.gearbox,
    this.colorName,
    this.typeDocument,
    this.ownerStep,
    this.purchasedDate,
    this.isRastamojen,
    this.description,
    this.ownerEmail,
    this.ownerName,
    this.ownerPhone,
    this.city,
    this.regionId,
    this.price,
    this.currency,
    this.mileage,
    this.hasGasBalloon,
    this.callTimeFrom,
    this.callTimeTo,
    this.isCallTimed,
    this.showOwnerContacts,
    this.isContactsVerified,
    this.rentToBuy,
    this.isWithoutMileage,
    this.milageImage,
    this.gasEquipmentId,
    this.getModificationStatus,
  });
}
class PostingAdSelectEquipmentEvent extends PostingAdEvent{

  final EquipmentEntity  equipment;
  PostingAdSelectEquipmentEvent({required this.equipment});
}

class PostingAdChangeAppBarShadowEvent extends PostingAdEvent {
  final bool value;

  PostingAdChangeAppBarShadowEvent({required this.value});
}

class PostingAdGetGasEquipments extends PostingAdEvent {
  PostingAdGetGasEquipments();
}

class PostingAdGetEquipments extends PostingAdEvent {
  PostingAdGetEquipments();
}

class PostingAdGetEquipmentOptionsList extends PostingAdEvent {
  PostingAdGetEquipmentOptionsList();
}



class PostingAdChangeOption extends PostingAdEvent {
  final String type;
  final int id;
  final String itemName;
  final bool isAdd;
  final SO? selectOption;

  PostingAdChangeOption({
    required this.type,
    required this.id,
    required this.itemName,
    required this.isAdd,
    this.selectOption,
  });
}
