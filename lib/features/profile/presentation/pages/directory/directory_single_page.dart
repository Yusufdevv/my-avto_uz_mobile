import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/usecases/directory_single_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_dir_categories_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_directories_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/features/profile/presentation/pages/directory/service_or_products_screen.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_info_part.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_sliver_delegete.dart';
import 'package:auto/features/profile/presentation/widgets/go_all_button.dart';
import 'package:auto/features/profile/presentation/widgets/service_or_product_button.dart';
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

  final List<String> serviceProductList = const [
    'Техническое ОБСЛУЖИВАНИЕ',
    'СЛЕСАРНЫЕ РАБОТЫ',
    'РЕМОНТ ЭЛЕКТРООБОРУДОВАНИЯ',
    'ЗАПРАВКА КОНДИЦИОНЕРА И РЕМОНТ',
    'МОНТАЖ ДОП. ОБОРУДОВАНИЯ',
    'ЗАРЯДНЫЕ СТАНЦИИ',
  ];

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(
          // backgroundColor: Colors.teal,
          body: BlocBuilder<DirectoryBloc, DirectoryState>(
            builder: (context, state) {
              if (state.status.isSubmissionSuccess) {
                final directory = state.directory;
                // final dirCategories = List<DirCategoryEntity>.from(state.directory.category.map((x) => DirCategoryEntity.fromJson(x)));
                return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>
                      <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: DirectorySliverDelegate(
                          gallery: directory.gallery,
                          avatarImage: directory.avatar,
                          name: directory.name,
                          minHeight: MediaQuery.of(context).size.height * 0.11,
                          category: ''
                          // MyFunctions.getCategoriesName(dirCategories.cast<Category>())
                          ),
                    ),
                  ],

                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
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
                          latitude: directory.latitude,
                        ),
                        const SizedBox(height: 16),
                        GoAllButton(
                            padding: EdgeInsets.zero,
                            title: 'Популярные продукты',
                            onPressed: () {}),
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: serviceProductList.length,
                          itemBuilder: (context, index) =>
                              ServiceOrProductButton(
                            onTap: () {
                              Navigator.of(context,rootNavigator: true).push(
                                fade(
                                  page: ServiceOrProductsScreen(title: serviceProductList[index],),

                                ),

                              );
                            },
                            title: serviceProductList[index],
                            more: index % 2,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                        ),
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
