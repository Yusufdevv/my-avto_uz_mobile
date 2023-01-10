import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/usecases/get_dir_categories_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_directories_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'directory_event.dart';
part 'directory_state.dart';

class DirectoryBloc extends Bloc<DirectoryEvent, DirectoryState> {
  final GetDirectoriesUseCase getDirectoriesUseCase;
  final GetDirCategoriesUseCase getDirCategoriesUseCase;
  DirectoryBloc({
    required this.getDirCategoriesUseCase,
    required this.getDirectoriesUseCase,
  }) : super(DirectoryState(
            status: FormzStatus.pure,
            directories: const <DirectoryEntity>[],
            categories: const <DirCategoryEntity>[],
            directory: DirectoryEntity())) {
    on<GetDirectoriesEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getDirectoriesUseCase(NoParams());
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
        print('======= ${result.right}');
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          categories: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
