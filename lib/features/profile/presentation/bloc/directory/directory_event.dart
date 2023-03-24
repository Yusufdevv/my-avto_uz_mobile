part of 'directory_bloc.dart';

class DirectoryEvent {}
class DirectoryGetProductsOfSingleEvent extends DirectoryEvent  {
  final String slug;


  DirectoryGetProductsOfSingleEvent({required this.slug} );
}

class DirectoryGetCategoriesOfSingleEvent extends DirectoryEvent {
  final String slug;

  DirectoryGetCategoriesOfSingleEvent({required this.slug});
}

class GetDirCategoriesEvent extends DirectoryEvent {}

class GetMoreDirCategoriesEvent extends DirectoryEvent {
  String? next;

  GetMoreDirCategoriesEvent({this.next});
}

class GetDirectoriesEvent extends DirectoryEvent {
  final String search;
  String? next;

  GetDirectoriesEvent({this.search = '', this.next});
}

class GetMoreDirectoriesEvent extends DirectoryEvent {}

class GetDirectorySingleEvent extends DirectoryEvent {
  final String slug;

  GetDirectorySingleEvent({required this.slug});
}

class ChangeTabIndexEvent extends DirectoryEvent {
  final int index;

  ChangeTabIndexEvent({required this.index});
}

class DirectoryFilterEvent extends DirectoryEvent {
  String? regions;
  String? regionId;
  List<DirCategoryEntity>? selectedCategories;

  DirectoryFilterEvent({this.regions, this.selectedCategories, this.regionId});
}
