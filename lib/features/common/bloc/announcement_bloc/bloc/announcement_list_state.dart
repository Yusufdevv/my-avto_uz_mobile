part of 'announcement_list_bloc.dart';

class AnnouncementListState extends Equatable {
  final FormzStatus status;
  final int selected;
  final bool next;
  final String search;
  final int count;
  final List<Region> regions;
  final bool isFilter;
  final bool historySaved;
  final List<AnnouncementListEntity> announcementList;
  final SaveFilterModel saveFilterModel;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final Currency currency;
  final GearboxTypeEntity? gearboxType;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? driveType;
  final int? makeId;
  final int? modelId;
  final bool? isNew;
  final FormzStatus saveFilterStatus;

  const AnnouncementListState({
    this.status = FormzStatus.pure,
    this.selected = 0,
    this.next = false,
    this.search = '',
    this.count = 0,
    this.regions = const [],
    this.historySaved = false,
    this.isFilter = false,
    this.announcementList = const [],
    this.saveFilterModel = const SaveFilterModel(),
    this.yearValues,
    this.priceValues,
    this.currency = Currency.usd,
    this.gearboxType,
    this.bodyType,
    this.driveType,
    this.makeId,
    this.modelId,
    this.isNew,
    this.saveFilterStatus = FormzStatus.pure,
  });

  AnnouncementListState copyWith({
    FormzStatus? status,
    int? selected,
    bool? next,
    String? search,
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
    bool? isNew,
    FormzStatus? saveFilterStatus,
  }) =>
      AnnouncementListState(
        status: status ?? this.status,
        selected: selected ?? this.selected,
        next: next ?? this.next,
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
        isNew: isNew ?? this.isNew,
        saveFilterStatus: saveFilterStatus ?? this.saveFilterStatus,
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
        isNew,
        saveFilterStatus,
      ];
}
