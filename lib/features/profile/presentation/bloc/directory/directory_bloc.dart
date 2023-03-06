import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/dealers/domain/entities/dealer_single_entity.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/usecases/directory_single_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_dir_categories_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_directories_usecase.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'directory_event.dart';
part 'directory_state.dart';

class DirectoryBloc extends Bloc<DirectoryEvent, DirectoryState> {
  final GetDirectoriesUseCase getDirectoriesUseCase;
  final GetDirCategoriesUseCase getDirCategoriesUseCase;
  final DirectorySingleSingleUseCase directorySingleSingleUseCase;
  DirectoryBloc({
    required this.getDirCategoriesUseCase,
    required this.getDirectoriesUseCase,
    required this.directorySingleSingleUseCase,
  }) : super(DirectoryState(
          status: FormzStatus.pure,
          directories: const <DirectoryEntity>[],
          categories: const <DirCategoryEntity>[],
          selectedCategories: const <DirCategoryEntity>[],
          regions: '',
          regionId: '',
          directory: const DealerSingleEntity(),
        )) {
    on<GetDirectoriesEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getDirectoriesUseCase(Params(
          search: event.search,
          regions: state.regionId,
          categories:
              MyFunctions.textForDirCategory(state.selectedCategories)));
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          directories: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<GetDirCategoriesEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getDirCategoriesUseCase(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          categories: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<ChangeTabIndexEvent>((event, emit) {
      emit(state.copyWith(isIndexOne: event.index==1));
    });

    on<DirectoryFilterEvent>((event, emit) {
      emit(state.copyWith(
          regions: event.regions ?? state.regions,
          regionId: event.regionId ?? state.regionId,
          selectedCategories:
              event.selectedCategories ?? state.selectedCategories));
    });

    on<GetDirectorySingleEvent>((event, emit) async {
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
    });
  }
}
