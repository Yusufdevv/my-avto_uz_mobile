// ignore_for_file: avoid_positional_boolean_parameters

part of 'announcement_list_bloc.dart';

abstract class AnnouncementListEvent {
  const AnnouncementListEvent();
}

class AnnouncementListChooseEvent extends AnnouncementListEvent {
  AnnouncementListChooseEvent();
}

class GetAnnouncementList extends AnnouncementListEvent {


  const GetAnnouncementList( );
}

class GetMoreAnnouncementList extends AnnouncementListEvent {
  const GetMoreAnnouncementList();
}

class SetRegions extends AnnouncementListEvent {
  final List<RegionEntity> regions;

  const SetRegions({
    required this.regions,
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
  final SaleType? saleType;
  final bool? isNew;
  final int? historyId;

  const SetFilter({
    this.saleType,
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
  const ClearFilter();
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
  final bool? historySaved;

  const SetMakeModel({
    required this.make,
    this.modelId,
    this.modelName,
    this.historySaved,
  });
}

class ChangeAppBarEvent extends AnnouncementListEvent {
  final CrossFadeState? crossFadeState;

  const ChangeAppBarEvent({this.crossFadeState});
}
