part of 'announcement_list_bloc.dart';

class AnnouncementListState extends Equatable {
  final FormzStatus status;
  final bool next;
  final int? historyId;
  final int count;
  final List<RegionEntity> regions;
  final bool isFilter;
  final bool historySaved;
  final List<AnnouncementListEntity> announcementList;
  final SaveFilterModel saveFilterModel;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final Currency? currency;
  final SortStatus? sortStatus;
  final GearboxTypeEntity? gearboxType;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? driveType;
  final int? makeId;
  final int? modelId;
  final String? makeName;
  final String? modelName;
  final String? makeLogo;
  final bool? isNew;
  final FormzStatus saveFilterStatus;
  final CrossFadeState crossFadeState;

  const AnnouncementListState({
    this.status = FormzStatus.pure,
    this.next = false,
    this.historyId,
    this.count = 0,
    this.regions = const [],
    this.historySaved = false,
    this.isFilter = false,
    this.announcementList = const [],
    this.saveFilterModel = const SaveFilterModel(),
    this.yearValues,
    this.priceValues,
    this.currency = Currency.none,
    this.sortStatus = SortStatus.none,
    this.gearboxType,
    this.bodyType,
    this.driveType,
    this.makeId,
    this.modelId,
    this.makeName,
    this.modelName,
    this.makeLogo,
    this.isNew,
    this.saveFilterStatus = FormzStatus.pure,
    this.crossFadeState = CrossFadeState.showFirst,
  });

  AnnouncementListState copyWith({
    FormzStatus? status,
    bool? next,
    int? historyId,
    int? count,
    List<RegionEntity>? regions,
    bool? isFilter,
    bool? historySaved,
    List<AnnouncementListEntity>? announcementList,
    SaveFilterModel? saveFilterModel,
    RangeValues? yearValues,
    RangeValues? priceValues,
    Currency? currency,
    SortStatus? sortResult,
    GearboxTypeEntity? gearboxType,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? driveType,
    int? makeId,
    int? modelId,
    String? makeName,
    String? modelName,
    String? makeLogo,
    bool? isNew,
    FormzStatus? saveFilterStatus,
    CrossFadeState? crossFadeState,
  }) =>
      AnnouncementListState(
        status: status ?? this.status,
        next: next ?? this.next,
        historyId: historyId ?? this.historyId,
        count: count ?? this.count,
        regions: regions ?? this.regions,
        isFilter: isFilter ?? this.isFilter,
        historySaved: historySaved ?? this.historySaved,
        announcementList: announcementList ?? this.announcementList,
        saveFilterModel: saveFilterModel ?? this.saveFilterModel,
        yearValues: yearValues ?? this.yearValues,
        priceValues: priceValues ?? this.priceValues,
        currency: currency ?? this.currency,
        gearboxType: gearboxType ?? this.gearboxType,
        bodyType: bodyType ?? this.bodyType,
        driveType: driveType ?? this.driveType,
        makeId: makeId ?? this.makeId,
        modelId: modelId ?? this.modelId,
        makeName: makeName ?? this.makeName,
        modelName: modelName ?? this.modelName,
        makeLogo: makeLogo ?? this.makeLogo,
        isNew: isNew ?? this.isNew,
        saveFilterStatus: saveFilterStatus ?? this.saveFilterStatus,
        crossFadeState: crossFadeState ?? this.crossFadeState,
        sortStatus: sortResult ?? sortStatus,
      );

  @override
  List<Object?> get props => [
        status,
        next,
        count,
        regions,
        isFilter,
        historySaved,
        announcementList,
        saveFilterModel,
        yearValues,
        priceValues,
        currency,
        gearboxType,
        bodyType,
        driveType,
        makeId,
        modelId,
        makeName,
        modelName,
        makeLogo,
        isNew,
        saveFilterStatus,
        crossFadeState,
        historyId,
        sortStatus,
      ];
}
