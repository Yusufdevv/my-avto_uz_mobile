part of 'posting_ad_bloc.dart';

abstract class PostingAdEvent {}

class PostingAdClearControllersEvent extends PostingAdEvent{}

class PostingAdGetUserDataEvent extends PostingAdEvent {}

class PostingAdSendCodeEvent extends PostingAdEvent {
  final String phone;
  final Function(String) onSuccess;
  PostingAdSendCodeEvent({required this.phone, required this.onSuccess});
}

class PostingAdGetMinimumPriceEvent extends PostingAdEvent {}

class PostingAdGetAnnouncementEvent extends PostingAdEvent {
  final int id;

  PostingAdGetAnnouncementEvent({required this.id});
}

class PostingAdDamageEvent extends PostingAdEvent {
  final DamagedParts part;
  final DamageType type;

  PostingAdDamageEvent({required this.part, required this.type});
}

class PostingAdGetRegionsEvent extends PostingAdEvent {}

class PostingAdGetDistritsEvent extends PostingAdEvent {
  final int regionId;
  PostingAdGetDistritsEvent({required this.regionId});
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

class PostingAdMakesEvent extends PostingAdEvent {
  final String? name;
  PostingAdMakesEvent({this.name});
}

class PostingAdTopMakesEvent extends PostingAdEvent {
  final String? name;
  PostingAdTopMakesEvent({this.name});
}

class PostingAdGenerationsEvent extends PostingAdEvent {
  final int modelId;

  PostingAdGenerationsEvent({required this.modelId});
}

class PostingAdChooseEvent extends PostingAdEvent {
  final TextEditingController? phoneController;
  final TextEditingController? emailController;
  final TextEditingController? nameController;
  List<String>? gallery;
  final Region? region;
  final YearsEntity? yearsEntity;
  final int? districtId;
  final List<RentWithPurchaseEntity>? rentWithPurchaseConditions;
  final Map<DamagedParts, DamageType>? damagedParts;
  final int? modelId;
  final int? generationId;

  final int? popularTypeId;
  final int? makeId;
  final int? engineId;
  final int? selectedBodyTypeId;
  final int? driveTypeId;
  final int? gearboxId;
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
  final String? gasBalloonType;

  final String? callTimeFrom;
  final String? callTimeTo;
  final String? where;
  final String? toastMessage;

  final bool? hasGasBalloon;
  final bool? isRastamojen;
  final bool? isCallTimed;
  final bool? showOwnerContacts;
  final bool? isContactsVerified;
  final bool? rentToBuy;
  final bool? isWithoutMileage;
  final bool? showExactAddress;
  final bool? isNew;

  PostingAdChooseEvent({
    this.phoneController,
    this.emailController,
    this.nameController,
    this.toastMessage,
    this.where,
    this.damagedParts,
    this.isNew,
    this.rentWithPurchaseConditions,
    this.gallery,
    this.showExactAddress,
    this.districtId,
    this.driveTypeId,
    this.generationId,
    this.selectedBodyTypeId,
    this.yearsEntity,
    this.modelId,
    this.letter,
    this.makeId,
    this.popularTypeId,
    this.engineId,
    this.gearboxId,
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
    this.region,
    this.price,
    this.currency,
    this.mileage,
    this.hasGasBalloon,
    this.gasBalloonType,
    this.callTimeFrom,
    this.callTimeTo,
    this.isCallTimed,
    this.showOwnerContacts,
    this.isContactsVerified,
    this.rentToBuy,
    this.isWithoutMileage,
  });
}

class PostingAdChangeAppBarShadowEvent extends PostingAdEvent {
  final bool value;
  PostingAdChangeAppBarShadowEvent({required this.value});
}
