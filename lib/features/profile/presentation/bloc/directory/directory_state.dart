part of 'directory_bloc.dart';

class DirectoryState extends Equatable {
  final List<DirectoryEntity> directories;
  final DealerSingleEntity directory;
  final List<DirCategoryEntity> categories;
  final FormzStatus status;
  List<DirCategoryEntity> selectedCategories;
  String regions;
  String regionId;

  DirectoryState({
    required this.status,
    required this.directories,
    required this.directory,
    required this.categories,
    this.selectedCategories = const <DirCategoryEntity>[],
    this.regions = '',
    this.regionId = '',
  });

  DirectoryState copyWith({
    List<DirectoryEntity>? directories,
    DealerSingleEntity? directory,
    FormzStatus? status,
    List<DirCategoryEntity>? categories,
    List<DirCategoryEntity>? selectedCategories,
    String? regions,
    String? regionId,
  }) =>
      DirectoryState(
        directories: directories ?? this.directories,
        directory: directory ?? this.directory,
        categories: categories ?? this.categories,
        selectedCategories: selectedCategories ?? this.selectedCategories,
        status: status ?? this.status,
        regions: regions ?? this.regions,
        regionId: regionId ?? this.regionId,
      );

  @override
  List<Object?> get props => [
        directories,
        directory,
        status,
        categories,
        selectedCategories,
        regions,
        regionId
      ];
}
