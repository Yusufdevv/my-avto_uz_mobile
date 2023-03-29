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
  final RangeValues? yearValuess;
  final RangeValues? priceValuess;
  final Currency? currency;
  final SortStatus? sortStatus;
  final GearboxTypeEntity? gearboxType;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? driveType;
  final MakeEntity? make;
  final MakeEntity? model;
  final IsNew isNew;
  final SaleType saleType;
  final FormzStatus saveFilterStatus;
  final CrossFadeState crossFadeState;

  const AnnouncementListState({
    this.saleType = SaleType.all,
    this.status = FormzStatus.pure,
    this.next = false,
    this.historyId,
    this.count = 0,
    this.regions = const [],
    this.historySaved = false,
    this.isFilter = false,
    this.announcementList = const [],
    this.saveFilterModel = const SaveFilterModel(),
    this.yearValuess,
    this.priceValuess,
    this.currency = Currency.none,
    this.sortStatus = SortStatus.newest,
    this.gearboxType,
    this.bodyType,
    this.driveType,
    this.make,
    this.model,
    this.isNew = IsNew.all,
    this.saveFilterStatus = FormzStatus.pure,
    this.crossFadeState = CrossFadeState.showFirst,
  });

  AnnouncementListState copyWith({
    FormzStatus? status,
    bool? next,
    SaleType? saleType,
    int? historyId,
    int? count,
    List<RegionEntity>? regions,
    bool? isFilter,
    bool? historySaved,
    List<AnnouncementListEntity>? announcementList,
    SaveFilterModel? saveFilterModel,
    RangeValues? yearValuess,
    RangeValues? priceValuess,
    Currency? currency,
    SortStatus? sortResult,
    GearboxTypeEntity? gearboxType,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? driveType,
    MakeEntity? make,
    MakeEntity? model,
    IsNew? isNew,
    FormzStatus? saveFilterStatus,
    CrossFadeState? crossFadeState,
  }) =>
      AnnouncementListState(
        saleType: saleType ?? this.saleType,
        status: status ?? this.status,
        next: next ?? this.next,
        historyId: historyId ?? this.historyId,
        count: count ?? this.count,
        regions: regions ?? this.regions,
        isFilter: isFilter ?? this.isFilter,
        historySaved: historySaved ?? this.historySaved,
        announcementList: announcementList ?? this.announcementList,
        saveFilterModel: saveFilterModel ?? this.saveFilterModel,
        yearValuess: yearValuess?.end == 0 && yearValuess?.start == 0
            ? null
            : yearValuess ?? this.yearValuess,
        priceValuess: priceValuess?.end == 0 && priceValuess?.start == 0
            ? null
            : priceValuess ?? this.priceValuess,
        currency: currency ?? this.currency,
        gearboxType: gearboxType ?? this.gearboxType,
        bodyType: bodyType ?? this.bodyType,
        driveType: driveType ?? this.driveType,
        make: make?.id == -1 ? null : make ?? this.make,
        model: model?.id == -1 ? null : model ?? this.model,
        isNew: isNew ?? this.isNew,
        saveFilterStatus: saveFilterStatus ?? this.saveFilterStatus,
        crossFadeState: crossFadeState ?? this.crossFadeState,
        sortStatus: sortResult ?? sortStatus,
      );

  @override
  List<Object?> get props => [
        saleType,
        status,
        next,
        count,
        regions,
        isFilter,
        historySaved,
        announcementList,
        saveFilterModel,
        yearValuess,
        priceValuess,
        currency,
        gearboxType,
        bodyType,
        driveType,
        make,
        model,
        isNew,
        saveFilterStatus,
        crossFadeState,
        historyId,
        sortStatus,
      ];
}
