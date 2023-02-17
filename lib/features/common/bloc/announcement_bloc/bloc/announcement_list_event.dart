// ignore_for_file: avoid_positional_boolean_parameters

part of 'announcement_list_bloc.dart';

abstract class AnnouncementListEvent {
  const AnnouncementListEvent();
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
  final List<Region> regions;

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
  final bool? isNew;
  final int? historyId;
  const SetFilter({
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
  final int? makeId;
  final int? modelId;
  final String? makeName;
  final String? modelName;
  final String? makeLogo;
  final bool? isNew;
  final bool? historySaved;

  const SetMakeModel({
    this.makeId,
    this.modelId,
    this.makeName,
    this.modelName,
    this.makeLogo,
    this.isNew,
    this.historySaved,
  });
}

class ChangeAppBarEvent extends AnnouncementListEvent {
  final CrossFadeState? crossFadeState;

  const ChangeAppBarEvent({this.crossFadeState});
}
