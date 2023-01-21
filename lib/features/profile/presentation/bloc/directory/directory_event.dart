part of 'directory_bloc.dart';

class DirectoryEvent {}

class GetDirCategoriesEvent extends DirectoryEvent {}

class GetDirectoriesEvent extends DirectoryEvent {
  final String search;
  GetDirectoriesEvent({this.search = ''});
}

class GetDirectorySingleEvent extends DirectoryEvent {
  final String slug;
  GetDirectorySingleEvent({required this.slug});
}

class DirectoryFilterEvent extends DirectoryEvent {
  String? regions;
  String? regionId;
  List<DirCategoryEntity>? selectedCategories;
  DirectoryFilterEvent({this.regions, this.selectedCategories, this.regionId});
}
