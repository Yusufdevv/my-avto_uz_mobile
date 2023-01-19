import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_sliver_delegate.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/usecases/directory_single_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_dir_categories_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_directories_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_info_part.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_sliver_delegete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DirectorySinglePage extends StatefulWidget {
  final String slug;

  const DirectorySinglePage({
    required this.slug,
  });

  @override
  State<DirectorySinglePage> createState() => _DirectorySinglePageState();
}

class _DirectorySinglePageState extends State<DirectorySinglePage> {
  late DirectoryBloc bloc;

  @override
  void initState() {
    final repo = serviceLocator<GetUserListRepoImpl>();
    bloc = DirectoryBloc(
        getDirCategoriesUseCase: GetDirCategoriesUseCase(repository: repo),
        getDirectoriesUseCase: GetDirectoriesUseCase(repository: repo),
        directorySingleSingleUseCase:
            DirectorySingleSingleUseCase(repository: repo))
      ..add(GetDirectorySingleEvent(slug: widget.slug));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(
          body: BlocBuilder<DirectoryBloc, DirectoryState>(
            builder: (context, state) {
              if (state.status.isSubmissionSuccess) {
                final directory = state.directory;
                return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>
                      <Widget>[
                    SliverPersistentHeader(
                        pinned: true,
                        delegate: DirectorySliverDelegate(
                            gallery: [directory.avatar, directory.avatar],
                            avatarImage: directory.avatar,
                            name: directory.name,
                            minHeight:
                                MediaQuery.of(context).size.height * 0.11,
                            category: directory.name)),
                  ],
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DirectoryInfoPart(
                            address: directory.address,
                            phone: directory.phone,
                            name: directory.name,
                            contactFrom: directory.contactFrom,
                            contactTo: directory.contactTo,
                            description: directory.description,
                            longitude: directory.longitude,
                            latitude: directory.latitude),
                      ],
                    ),
                  ),
                );
              }
              return const Center(child: CupertinoActivityIndicator());
            },
          ),
        ),
      );
}
