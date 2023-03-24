part of 'directory_bloc.dart';

class DirectoryState extends Equatable {
  final List<DirectoryEntity> directories;
  final DealerSingleEntity directory;
  final List<DirCategoryEntity> categories;
  final FormzStatus status;
  final List<ProductsList> popularProducts;

  List<ProductCategoryEntity> singleCategories;
  List<DirCategoryEntity> selectedCategories;
  String regions;
  String search;
  String regionId;
  final String nextCategories;
  final String nextDirectories;
  final bool fetchMoreCategories;
  final bool fetchMoreDirectories;
  final bool isIndexOne;

    DirectoryState({
    required this.status,
    required this.directories,
    required this.directory,
    required this.categories,
    this.popularProducts = const <ProductsList>[],
    this.singleCategories = const <ProductCategoryEntity>[],
    this.selectedCategories = const <DirCategoryEntity>[],
    this.regions = '',
    this.regionId = '',
    this.search = '',
    this.isIndexOne = false,
    this.nextCategories = '',
    this.nextDirectories = '',
    this.fetchMoreCategories = false,
    this.fetchMoreDirectories = false,
  });

  DirectoryState copyWith({
    List<ProductsList>? popularProducts,
    List<ProductCategoryEntity>? singleCategories,
    List<DirectoryEntity>? directories,
    DealerSingleEntity? directory,
    FormzStatus? status,
    List<DirCategoryEntity>? categories,
    List<DirCategoryEntity>? selectedCategories,
    String? regions,
    String? regionId,
    String? search,
    bool? isIndexOne,
    String? nextCategories,
    String? nextDirectories,
    bool? fetchMoreCategories,
    bool? fetchMoreDirectories,
  }) =>
      DirectoryState(
        popularProducts: popularProducts ?? this.popularProducts,
        singleCategories: singleCategories ?? this.singleCategories,
        directories: directories ?? this.directories,
        directory: directory ?? this.directory,
        categories: categories ?? this.categories,
        selectedCategories: selectedCategories ?? this.selectedCategories,
        status: status ?? this.status,
        regions: regions ?? this.regions,
        regionId: regionId ?? this.regionId,
        search: search ?? this.search,
        isIndexOne: isIndexOne ?? this.isIndexOne,
        nextDirectories: nextDirectories ?? this.nextDirectories,
        nextCategories: nextCategories ?? this.nextCategories,
        fetchMoreDirectories: fetchMoreDirectories ?? this.fetchMoreDirectories,
        fetchMoreCategories: fetchMoreCategories ?? this.fetchMoreCategories,
      );

  @override
  List<Object?> get props => [
        popularProducts,
        singleCategories,
        directories,
        directory,
        status,
        categories,
        selectedCategories,
        regions,
        search,
        regionId,
        isIndexOne,
        nextCategories,
        nextDirectories,
        fetchMoreCategories,
        fetchMoreDirectories
      ];
}
