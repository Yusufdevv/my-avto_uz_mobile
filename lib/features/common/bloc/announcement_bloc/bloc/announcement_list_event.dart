// ignore_for_file: avoid_positional_boolean_parameters

part of 'announcement_list_bloc.dart';

abstract class AnnouncementListEvent {
  const AnnouncementListEvent();
}
class AnnouncementListChooseEvent extends AnnouncementListEvent {



  AnnouncementListChooseEvent( );
}


class GetAnnouncementList extends AnnouncementListEvent {
  final bool? isNew;

  const GetAnnouncementList({this.isNew});
}

class GetMoreAnnouncementList extends AnnouncementListEvent {
  final bool? isNew;

  const GetMoreAnnouncementList({this.isNew});
}

class SetRegions extends AnnouncementListEvent {
  final bool? isNew;
  final List<RegionEntity> regions;

  const SetRegions({
    required this.regions,
    this.isNew,
  });
}

class SetSort extends AnnouncementListEvent {
  final SortStatus? sortResult;

  const SetSort({
    required this.sortResult,
  });
}

class SetFilter extends AnnouncementListEvent {
  final Currency? currency;
  final GearboxTypeEntity? gearboxType;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? driveType;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final bool? isFilter;
  final bool? historySaved;
  final bool? isRentWithPurchase;
  final bool? isNew;
  final int? historyId;

  const SetFilter({
    this.isRentWithPurchase,
    this.currency,
    this.historyId,
    this.gearboxType,
    this.bodyType,
    this.driveType,
    this.yearValues,
    this.priceValues,
    this.isFilter,
    this.historySaved,
    this.isNew,
  });
}

class ClearFilter extends AnnouncementListEvent {
  final bool? isNew;

  const ClearFilter(this.isNew);
}

class SaveHistory extends AnnouncementListEvent {
  const SaveHistory();
}

class ChangeSaveFilterStatus extends AnnouncementListEvent {
  final FormzStatus status;

  const ChangeSaveFilterStatus(this.status);
}

class SetMakeModel extends AnnouncementListEvent {
  final MakeEntity make;
  final int? modelId;
  final String? modelName;
  final bool? isNew;
  final bool? historySaved;

  const SetMakeModel({
    required this.make,
    this.modelId,
    this.modelName,
    this.isNew,
    this.historySaved,
  });
}

class ChangeAppBarEvent extends AnnouncementListEvent {
  final CrossFadeState? crossFadeState;

  const ChangeAppBarEvent({this.crossFadeState});
}
