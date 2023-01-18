import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/dealers/domain/entities/dealer_info_entity.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/entities/profile_data_entity.dart';
import 'package:auto/features/profile/domain/usecases/directory_single_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_dir_categories_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_directories_usecase.dart';
import 'package:auto/features/reels/domain/entities/dealer_entity.dart';
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
  }) : super(const DirectoryState(
            status: FormzStatus.pure,
            directories: <DirectoryEntity>[],
            categories: <DirCategoryEntity>[],
            selectedCategories: <DirCategoryEntity>[],
            regions: '',
            directory:DealerSingleEntity(),)) {
    on<GetDirectoriesEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getDirectoriesUseCase(Params(
          search: event.search,
          regions: state.regions,
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

    on<DirectoryFilterEvent>((event, emit) {
      emit(state.copyWith(
          regions: event.regions,
          selectedCategories: event.selectedCategories));
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
