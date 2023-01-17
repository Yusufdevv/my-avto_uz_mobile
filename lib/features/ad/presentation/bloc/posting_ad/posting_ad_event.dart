part of 'posting_ad_bloc.dart';

abstract class PostingAdEvent {}

class PostingAdBodyTypesEvent extends PostingAdEvent {
  PostingAdBodyTypesEvent();
}



class PostingAdGearBoxesEvent extends PostingAdEvent {
  PostingAdGearBoxesEvent();
}

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
  final Region? region;
  final YearsEntity? yearsEntity;
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
  final String? boughtTime;
  final String? description;
  final String? city;
  final String? price;
  final String? currency;
  final String? mileage;
  final String? gasBalloonType;

  final String? callTimeFrom;
  final String? callTimeTo;

  final bool? hasGasBalloon;
  final bool? isRastamojen;
  final bool? isCallTimed;
  final bool? showOwnerContacts;
  final bool? isContactsVerified;
  final bool? rentToBuy;
  final bool?isWithoutMileage;

  PostingAdChooseEvent({
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
    this.boughtTime,
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
