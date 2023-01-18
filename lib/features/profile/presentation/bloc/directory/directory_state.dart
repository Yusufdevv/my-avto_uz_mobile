part of 'directory_bloc.dart';

class DirectoryState extends Equatable {
  final List<DirectoryEntity> directories;
  final DealerSingleEntity directory;
  final List<DirCategoryEntity> categories;
  final FormzStatus status;
 final List<DirCategoryEntity> selectedCategories;
 final String regions;

  const DirectoryState({
    required this.status,
    required this.directories,
    required this.directory,
    required this.categories,
    required this.selectedCategories,
    required this.regions,
  });

  DirectoryState copyWith(
          {List<DirectoryEntity>? directories,
          DealerSingleEntity? directory,
          FormzStatus? status,
          List<DirCategoryEntity>? categories,
          List<DirCategoryEntity>? selectedCategories,
   String? regions,

          }) =>
      DirectoryState(
        directories: directories ?? this.directories,
        directory: directory ?? this.directory,
        categories: categories ?? this.categories,
        selectedCategories: selectedCategories ?? this.selectedCategories,
        status: status ?? this.status,
        regions: regions ?? this.regions,
      );

  @override
  List<Object?> get props => [directories, directory, status, categories, selectedCategories, regions];
}
