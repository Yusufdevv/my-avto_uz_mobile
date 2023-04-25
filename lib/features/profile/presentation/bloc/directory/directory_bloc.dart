import 'dart:async';
import 'dart:developer';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/usecases/get_regions_usecase.dart';
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
  final GetRegionsUseCase getRegionsUseCase = GetRegionsUseCase();
  final ProductListUseCase productListUseCase = ProductListUseCase();
  final GetDirectoriesUseCase getDirectoriesUseCase = GetDirectoriesUseCase();
  final GetDirCategoriesUseCase getDirCategoriesUseCase = GetDirCategoriesUseCase();
  final DirectorySingleSingleUseCase directorySingleSingleUseCase = DirectorySingleSingleUseCase();
  final ProductCategoryUseCase productCategoryUseCase = ProductCategoryUseCase();

  DirectoryBloc()
      : super(DirectoryState(
          getRegionsStatus: FormzStatus.pure,
          status: FormzStatus.pure,
          directories: const <DirectoryEntity>[],
          categories: const <DirCategoryEntity>[],
          directory: const DealerSingleEntity(),
        )) {
    on<DirectoryGetProductsOfSingleEvent>(_getProducts);
    on<DirectoryGetCategoriesOfSingleEvent>(_getCategoriesOfSingle);
    on<DirectorySetRegionsEvent>(_setRegions);
    on<DirectoryClearFilterEvent>(_clearFilter);
    on<DirectorySetCategoryEvent>(_setCategory);
    on<GetDirectoriesEvent>(_getDirectories);
    on<GetMoreDirectoriesEvent>(_getMoreDirectories);
    on<GetDirCategoriesEvent>(_getDirCategories);
    on<OnTabIndexChangedEvent>(_onTabIndexChanged);
    on<GetDirectorySingleEvent>(_getDirectorySingle);
    on<DirectoryGetRegionsEvent>(_getRegions);
  }

  FutureOr<void> _getRegions(DirectoryGetRegionsEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(getRegionsStatus: FormzStatus.submissionInProgress));
    final result = await getRegionsUseCase.call(NoParams());
    if (result.isRight) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          regions: result.right,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _onTabIndexChanged(OnTabIndexChangedEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(isIndexOne: event.index == 1));
  }

  FutureOr<void> _getDirectorySingle(GetDirectorySingleEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final result = await directorySingleSingleUseCase.call(event.slug);
    if (result.isRight) {
      emit(
        state.copyWith(status: FormzStatus.submissionSuccess, directory: result.right),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _setCategory(DirectorySetCategoryEvent event, Emitter<DirectoryState> emit) async {
    final v = state.selectedCategories.map(MapEntry.new);
    if (state.selectedCategories.containsKey(event.category.id)) {
      v.remove(event.category.id);
    } else {
      v[event.category.id] = event.category;
    }

    emit(state.copyWith(selectedCategories: v));
  }

  FutureOr<void> _setRegions(DirectorySetRegionsEvent event, Emitter<DirectoryState> emit) async {
    add(GetDirCategoriesEvent());
    emit(state.copyWith(selectedRegions: event.regions));
  }

  FutureOr<void> _getProducts(DirectoryGetProductsOfSingleEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await productListUseCase.call(event.slug);
    if (result.isRight) {
      var popularProducts = [...result.right.results]..retainWhere((element) => element.isPopular);

      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          directoryProducts: result.right.results,
          popularProducts: popularProducts,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _clearFilter(DirectoryClearFilterEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(selectedCategories: {}, selectedRegions: []));
  }

  FutureOr<void> _getCategoriesOfSingle(DirectoryGetCategoriesOfSingleEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await productCategoryUseCase.call(event.slug);
    if (result.isRight) {
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
        singleCategories: result.right.results.where((element) => element.productsCount > 0).toList(),
      ));
    } else {
      emit(
        state.copyWith(status: FormzStatus.submissionFailure),
      );
    }
  }

  FutureOr<void> _getDirectories(GetDirectoriesEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress, search: event.search));
    final reg = MyFunctions.regionsToApi(state.selectedRegions);
    final v = MyFunctions.textForDirCategory(state.selectedCategories);
    log(':::::::::: the categories to api:  ${v}  ::::::::::');
    final result = await getDirectoriesUseCase(Params(search: event.search, regions: reg, categories: v));
    if (result.isRight) {
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          directories: result.right.results,
          fetchMoreDirectories: result.right.next != null,
          nextDirectories: result.right.next));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getMoreDirectories(GetMoreDirectoriesEvent event, Emitter<DirectoryState> emit) async {
    final v = MyFunctions.textForDirCategory(state.selectedCategories);
    log(':::::::::: the categories to api:  ${v}  ::::::::::');
    final result = await getDirectoriesUseCase(
      Params(
        search: state.search,
        regions: MyFunctions.regionsToApi(state.selectedRegions),
        categories: v,
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

  FutureOr<void> _getDirCategories(GetDirCategoriesEvent event, Emitter<DirectoryState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await getDirCategoriesUseCase(MyFunctions.regionsToApi(state.selectedRegions));
    if (result.isRight) {
      Map<int, DirCategoryEntity> v = {};
      for (final e in result.right.results) {
        v[e.id] = e;
      }
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
        categories: result.right.results,
        selectedCategories: v,
        fetchMoreCategories: result.right.next != null,
        nextCategories: result.right.next,
      ));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
