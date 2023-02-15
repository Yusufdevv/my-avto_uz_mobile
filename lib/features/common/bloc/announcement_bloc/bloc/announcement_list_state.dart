part of 'announcement_list_bloc.dart';

class AnnouncementListState extends Equatable {
  final FormzStatus status;
  final int selected;
  final bool next;
  final String search;
  final int? historyId;
  final int count;
  final List<Region> regions;
  final bool isFilter;
  final bool historySaved;
  final List<AnnouncementListEntity> announcementList;
  final SaveFilterModel saveFilterModel;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final Currency? currency;
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
    this.selected = 0,
    this.next = false,
    this.search = '',
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
    int? selected,
    bool? next,
    String? search,
    int? historyId,
    int? count,
    List<Region>? regions,
    bool? isFilter,
    bool? historySaved,
    List<AnnouncementListEntity>? announcementList,
    SaveFilterModel? saveFilterModel,
    RangeValues? yearValues,
    RangeValues? priceValues,
    Currency? currency,
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
        selected: selected ?? this.selected,
        next: next ?? this.next,
        historyId: historyId ?? this.historyId,
        search: search ?? this.search,
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
      );

  @override
  List<Object?> get props => [
        status,
        selected,
        next,
        search,
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
      ];
}
