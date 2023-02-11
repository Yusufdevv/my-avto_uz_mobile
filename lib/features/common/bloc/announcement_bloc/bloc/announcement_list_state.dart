part of 'announcement_list_bloc.dart';

class AnnouncementListState extends Equatable {
  final FormzStatus status;
  final int selected;
  final bool next;
  final String search;
  final SearchHistoryModel searchModel;
  final int count;
  final List<Region> regions;
  final bool isFilter;
  final List<AnnouncementListEntity> announcementList;
  final SearchHistoryEntity searchHistory;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final Currency currency;
  final GearboxTypeEntity? gearboxType;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? driveType;
  final int? makeId;
  final int? modelId;
  final bool? isNew;

  const AnnouncementListState({
    this.status = FormzStatus.pure,
    this.selected = 0,
    this.next = false,
    this.search = '',
    this.searchModel = const SearchHistoryModel(),
    this.count = 0,
    this.regions = const [],
    this.isFilter = false,
    this.announcementList = const [],
    this.searchHistory = const SearchHistoryEntity(),
    this.yearValues,
    this.priceValues,
    this.currency = Currency.usd,
    this.gearboxType,
    this.bodyType,
    this.driveType,
    this.makeId,
    this.modelId,
    this.isNew,
  });

  AnnouncementListState copyWith({
    FormzStatus? status,
    int? selected,
    bool? next,
    String? search,
    SearchHistoryModel? searchModel,
    int? count,
    List<Region>? regions,
    bool? isFilter,
    List<AnnouncementListEntity>? announcementList,
    SearchHistoryEntity? searchHistory,
    RangeValues? yearValues,
    RangeValues? priceValues,
    Currency? currency,
    GearboxTypeEntity? gearboxType,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? driveType,
    int? makeId,
    int? modelId,
    bool? isNew,
  }) =>
      AnnouncementListState(
        status: status ?? this.status,
        selected: selected ?? this.selected,
        next: next ?? this.next,
        search: search ?? this.search,
        searchModel: searchModel ?? this.searchModel,
        count: count ?? this.count,
        regions: regions ?? this.regions,
        isFilter: isFilter ?? this.isFilter,
        announcementList: announcementList ?? this.announcementList,
        searchHistory: searchHistory ?? this.searchHistory,
        yearValues: yearValues ?? this.yearValues,
        priceValues: priceValues ?? this.priceValues,
        currency: currency ?? this.currency,
        gearboxType: gearboxType ?? this.gearboxType,
        bodyType: bodyType ?? this.bodyType,
        driveType: driveType ?? this.driveType,
        makeId: makeId ?? this.makeId,
        modelId: modelId ?? this.modelId,
        isNew: isNew ?? this.isNew,
      );

  @override
  List<Object?> get props => [
        status,
        selected,
        next,
        search,
        searchModel,
        count,
        regions,
        isFilter,
        announcementList,
        searchHistory,
        yearValues,
        priceValues,
        currency,
        gearboxType,
        bodyType,
        driveType,
        makeId,
        modelId,
        isNew,
      ];
}
