part of 'edit_ad_bloc.dart';

abstract class EditAdEvent {
  const EditAdEvent();
}

class EditAdShowToastEvent extends EditAdEvent {
  final String message;
  final PopStatus status;

  EditAdShowToastEvent({required this.message, required this.status});
}
class EditAdGetEquipmentOptionsList extends EditAdEvent {


  EditAdGetEquipmentOptionsList( );
}
class EditAdSelectEquipmentEvent extends EditAdEvent {
  final EquipmentEntity equipment;

  EditAdSelectEquipmentEvent({required this.equipment});
}


class EditAdClearStateEvent extends EditAdEvent {}

class EditAdAddEventForEveryPage extends EditAdEvent {
  final int page;

  EditAdAddEventForEveryPage({required this.page});
}

class EditAdGetMapScreenShotEvent extends EditAdEvent {
  final double lat;
  final double long;
  final double zoomLevel;

  EditAdGetMapScreenShotEvent(
      {required this.lat, required this.long, required this.zoomLevel});
}

class EditAdClearControllersEvent extends EditAdEvent {}

class EditAdGetUserDataEvent extends EditAdEvent {}

class EditAdSendCodeEvent extends EditAdEvent {
  final String phone;
  final Function(String) onSuccess;

  EditAdSendCodeEvent({required this.phone, required this.onSuccess});
}
class EditAdGetColorsEvent extends EditAdEvent {
  final String? next;


  EditAdGetColorsEvent({ this.next} );
}


class EditAdGetMinimumPriceEvent extends EditAdEvent {}

class EditAdGetAnnouncementEvent extends EditAdEvent {
  final int id;

  EditAdGetAnnouncementEvent({required this.id});
}

class EditAdDamageEvent extends EditAdEvent {
  final DamagedPart part;
  final DamageType type;

  EditAdDamageEvent({required this.part, required this.type});
}

class EditAdGetRegionsEvent extends EditAdEvent {}

class EditAdGetDistritsEvent extends EditAdEvent {
  final int regionId;

  EditAdGetDistritsEvent({required this.regionId});
}

class EditAdSubmitEvent extends EditAdEvent {
  final int announcementId;

  const EditAdSubmitEvent(this.announcementId);
}

class EditAdOnRentWithPurchaseEvent extends EditAdEvent {
  final RentWithPurchaseEntity condition;

  EditAdOnRentWithPurchaseEvent({required this.condition});
}

class EditAdChooseEvent extends EditAdEvent {
  final TextEditingController? phoneController;
  final TextEditingController? emailController;
  final TextEditingController? nameController;
  final TextEditingController? searchController;
  final List<String>? gallery;
  final List<String>? panaramaGallery;
  final RegionEntity? region;
  final List<YearsEntity>? years;
  final DistrictEntity? district;
  final Map<DamagedPart, DamageType>? damagedParts;
  final ModificationTypeEntity? modification;
  final MakeEntity? model;
  final CarGenerationEntity? generationEntity;

  final int? popularTypeId;
  final MakeEntity? make;
  final int? engineId;
  final BodyTypeEntity? bodyType;
  final int? driveTypeId;
  final GearboxTypeEntity? gearbox;
  final YearsEntity? yearEntity;
  final Uint8List? bodyBytes;
  final String? milageImage;
  final ColorEntity? color;
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
  final String? locationUrl;

  final bool? hasGasBalloon;
  final bool? isRastamojen;
  final bool? isCallTimed;
  final bool? showOwnerContacts;
  final bool? isContactsVerified;
  final bool? rentToBuy;
  final bool? isWithoutMileage;
  final bool? showExactAddress;
  final bool? isNew;
  final int? equipmentId;

  EditAdChooseEvent({
    this.modification,
    this.searchController,
    this.panaramaGallery,
    this.bodyBytes,
    this.yearEntity,
    this.locationUrl,
    this.phoneController,
    this.emailController,
    this.nameController,
    this.toastMessage,
    this.where,
    this.damagedParts,
    this.isNew,
    this.gallery,
    this.showExactAddress,
    this.district,
    this.driveTypeId,
    this.generationEntity,
    this.bodyType,
    this.years,
    this.model,
    this.make,
    this.popularTypeId,
    this.engineId,
    this.gearbox,
    this.color,
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
    this.milageImage,
    this.equipmentId,
  });
}

class EditAdChangeAppBarShadowEvent extends EditAdEvent {
  final bool value;

  EditAdChangeAppBarShadowEvent({required this.value});
}

class EditAdGetEquipments extends EditAdEvent {
  EditAdGetEquipments();
}

class EditAdChangeOption extends EditAdEvent {
  final String type;
  final int id;
  final String itemName;
  final bool isAdd;
  final SO? selectOption;

  EditAdChangeOption({
    required this.type,
    required this.id,
    required this.itemName,
    required this.isAdd,
    this.selectOption,
  });
}