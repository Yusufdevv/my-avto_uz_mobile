import 'dart:async';
import 'dart:developer';

import 'package:auto/features/dealers/domain/entities/dealer_single_entity.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/entities/product_category.dart';
import 'package:auto/features/profile/domain/entities/products_list.dart';
import 'package:auto/features/profile/domain/usecases/cart_product_category_usecase.dart';
import 'package:auto/features/profile/domain/usecases/directory_single_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_dir_categories_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_directories_usecase.dart';
import 'package:auto/features/profile/domain/usecases/product_list_use_case.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'directory_event.dart';

part 'directory_state.dart';

class DirectoryBloc extends Bloc<DirectoryEvent, DirectoryState> {
  final ProductListUseCase productListUseCase = ProductListUseCase();
  final GetDirectoriesUseCase getDirectoriesUseCase = GetDirectoriesUseCase();
  final GetDirCategoriesUseCase getDirCategoriesUseCase =
      GetDirCategoriesUseCase();
  final DirectorySingleSingleUseCase directorySingleSingleUseCase =
      DirectorySingleSingleUseCase();
  final ProductCategoryUseCase productCategoryUseCase =
      ProductCategoryUseCase();

  DirectoryBloc()
      : super(DirectoryState(
          status: FormzStatus.pure,
          directories: const <DirectoryEntity>[],
          categories: const <DirCategoryEntity>[],
          directory: const DealerSingleEntity(),
        )) {
    on<DirectoryGetProductsOfSingleEvent>(_getProducts);
    on<DirectoryGetCategoriesOfSingleEvent>(_getCategoriesOfSingle);
    on<DirectorySetRegionEvent>(_setRegion);
    on<DirectoryClearFilterEvent>(_clearFilter);
    on<DirectorySetCategoryEvent>(_setCategory);
    on<GetDirectoriesEvent>(_getDirectories);
    on<GetMoreDirectoriesEvent>(_getMoreDirectories);
    on<GetDirCategoriesEvent>(_getDirCategories);
    on<GetMoreDirCategoriesEvent>(_getMoreDirCategories);
    on<OnTabIndexChangedEvent>(_onTabIndexChanged);
    on<GetDirectorySingleEvent>(_getDirectorySingle);
  }

  FutureOr<void> _onTabIndexChanged(
      OnTabIndexChangedEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(isIndexOne: event.index == 1));
  }

  FutureOr<void> _getDirectorySingle(
      GetDirectorySingleEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final result = await directorySingleSingleUseCase.call(event.slug);
    if (result.isRight) {
      emit(
        state.copyWith(
            status: FormzStatus.submissionSuccess, directory: result.right),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _setCategory(
      DirectorySetCategoryEvent event, Emitter<DirectoryState> emit) async {
    var v = state.selectedCategories.map(MapEntry.new);
    if (state.selectedCategories.containsKey(event.category.id)) {
      v.remove(event.category.id);
    } else {
      v[event.category.id] = event.category;
    }

    emit(state.copyWith(selectedCategories: v));
  }

  FutureOr<void> _setRegion(
      DirectorySetRegionEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(selectedRegions: event.regions));
  }

  FutureOr<void> _getProducts(DirectoryGetProductsOfSingleEvent event,
      Emitter<DirectoryState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await productListUseCase.call(event.slug);
    if (result.isRight) {
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          popularProducts: result.right.results));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _clearFilter(
      DirectoryClearFilterEvent event, Emitter<DirectoryState> emit) async {
    emit(DirectoryState(
        status: state.status,
        directories: state.directories,
        directory: state.directory,
        categories: [],
        regions: [],
        popularProducts: state.popularProducts));
  }

  FutureOr<void> _getCategoriesOfSingle(
      DirectoryGetCategoriesOfSingleEvent event,
      Emitter<DirectoryState> emit) async {
    log(':::::::::: DirectoryGetCategoriesOfSingleEvent triggered by:  ${event.slug}  ::::::::::');
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await productCategoryUseCase.call(event.slug);
    if (result.isRight) {
      log(':::::::::: GOTTEN SINGLE CATEGORIES:  ${result.right.results}  ::::::::::');
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
        singleCategories: result.right.results
            .where((element) => element.productsCount > 0)
            .toList(),
      ));
    } else {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }

  FutureOr<void> _getDirectories(
      GetDirectoriesEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(
        status: FormzStatus.submissionInProgress, search: event.search));
    final reg = MyFunctions.regionsToApi(state.selectedRegions);
    log(':::::::::: REGION TO API RESULT: ${reg}  ::::::::::');
    final result = await getDirectoriesUseCase(Params(
        search: event.search,
        regions: reg,
        categories: MyFunctions.textForDirCategory(state.selectedCategories)));
    if (result.isRight) {
      log(':::::::::: the filtered gotten directories:  ${result.right.next}  ::::::::::');
      log(':::::::::: previos:  ${result.right.previous}  ::::::::::');
      log(':::::::::: the filtered gotten directories:  ${result.right.results.length}  ::::::::::');
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          directories: result.right.results,
          fetchMoreDirectories: result.right.next != null,
          nextDirectories: result.right.next));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getMoreDirectories(
      GetMoreDirectoriesEvent event, Emitter<DirectoryState> emit) async {
    final result = await getDirectoriesUseCase(
      Params(
        search: state.search,
        regions: MyFunctions.regionsToApi(state.selectedRegions),
        categories: MyFunctions.textForDirCategory(state.selectedCategories),
        next: state.nextDirectories,
      ),
    );

    if (result.isRight) {
      emit(
        state.copyWith(
          directories: [...state.directories, ...result.right.results],
          fetchMoreDirectories: result.right.next != null,
          nextDirectories: result.right.next,
        ),
      );
    }
  }

  FutureOr<void> _getDirCategories(
      GetDirCategoriesEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await getDirCategoriesUseCase(null);
    if (result.isRight) {
      log(':::::::::: the result of get directory:  ${result.right}  ::::::::::');
      log(':::::::::: results:  ${result.right.results}  ::::::::::');
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          categories: result.right.results,
          fetchMoreCategories: result.right.next != null,
          nextCategories: result.right.next));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getMoreDirCategories(
      GetMoreDirCategoriesEvent event, Emitter<DirectoryState> emit) async {
    final result = await getDirCategoriesUseCase(event.next);
    if (result.isRight) {
      emit(state.copyWith(
        categories: [...state.categories, ...result.right.results],
        fetchMoreCategories: result.right.next != null,
        nextCategories: result.right.next,
      ));
    }
  }
}
