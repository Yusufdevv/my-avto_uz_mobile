import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_sliver_delegate.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/usecases/directory_single_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_dir_categories_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_directories_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            builder: (context, state) => NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SellerSliverDelegate(
                      gallery: [state.directory.avatar],
                      avatarImage: state.directory.avatar,
                      dealerName: state.directory.name,
                      minHeight: MediaQuery.of(context).size.height * 0.11,
                      showroomOrPerson: 'Avtasalon'),
                ),
              ],
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SellerInfo(
                      dealerName: state.directory.name,
                      quantityOfCars: state.directory.carCount,
                      contactFrom: state.directory.contactFrom,
                      contactTo: state.directory.contactTo,
                      contact: state.directory.phone,
                      additionalInfo: state.directory.description,
                      longitude: state.directory.longitude,
                      latitude: state.directory.latitude,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
