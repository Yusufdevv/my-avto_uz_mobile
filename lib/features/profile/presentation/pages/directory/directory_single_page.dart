import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/usecases/directory_single_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_dir_categories_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_directories_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_info_part.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_sliver_delegete.dart';
import 'package:auto/features/profile/presentation/pages/directory/product_screen.dart';
import 'package:auto/features/profile/presentation/pages/directory/service_or_products_screen.dart';
import 'package:auto/features/profile/presentation/widgets/directory_item.dart';
import 'package:auto/features/profile/presentation/pages/directory/service_or_products_screen.dart';
import 'package:auto/features/profile/presentation/widgets/go_all_button.dart';
import 'package:auto/features/profile/presentation/widgets/service_or_product_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../dealers/presentation/widgets/dealer_single_info_part.dart';

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
  late ProfileBloc profileBloc;

  @override
  void initState() {
    final repo = serviceLocator<GetUserListRepoImpl>();
    bloc = DirectoryBloc(
        getDirCategoriesUseCase: GetDirCategoriesUseCase(repository: repo),
        getDirectoriesUseCase: GetDirectoriesUseCase(repository: repo),
        directorySingleSingleUseCase:
            DirectorySingleSingleUseCase(repository: repo))
      ..add(GetDirectorySingleEvent(slug: widget.slug));
    profileBloc = ProfileBloc()
      ..add(GetProductCategoryEvent(
        slug: widget.slug,
      ))
      ..add(GetProductListEvent(slug: widget.slug));
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
              print('SLUG IS -> ${widget.slug}');
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
                  body: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      print('dkslnl -> ${state.productCategoryModel}');
                      print('dkslnl -> ${state.getProductCategoryStatus}');
                      print('fskl -> ${state.productCategory}');
                      print('fskl -> ${state.getProductListStatus}');
                      return ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.max,
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
                          if (state.productCategory.isNotEmpty)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: GoAllButton(
                                padding: EdgeInsets.zero,
                                title: 'Популярные продукты',
                                onPressed: () {
                                  Navigator.of(context).push(
                                    fade(
                                      page: ProductsScreen(
                                        title: 'Все продукты',
                                        bloc: profileBloc,
                                        slug: widget.slug,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          else
                            const SizedBox(),
                          Container(
                            height: 120,
                            margin: const EdgeInsets.only(top: 13, bottom: 32),
                            child: Paginator(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => DirectoryItem(
                                image: state.cartProductEntity[index].image,
                                title: state.cartProductEntity[index].name,
                                idx: index,
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 13),
                              paginatorStatus: FormzStatus.submissionSuccess,
                              // state.getProductListStatus,
                              itemCount: state.productCategory.length,
                              fetchMoreFunction: () {},
                              hasMoreToFetch: false,
                              errorWidget: const CupertinoActivityIndicator(),
                            ),
                          ),
                          if (state.productCategoryModel.isNotEmpty)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: GoAllButton(
                                padding: EdgeInsets.zero,
                                title: 'Категории услуг/товаров',
                                onPressed: () {},
                                hasButton: false,
                              ),
                            )
                          else
                            const SizedBox(),
                          Paginator(
                            padding: const EdgeInsets.only(top: 16, bottom: 8),
                            paginatorStatus: FormzStatus.submissionSuccess,
                            itemBuilder: (context, index) =>
                                ServiceOrProductButton(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  fade(
                                    page: ServiceOrProductsScreen(
                                      title: state
                                          .productCategoryModel[index].name,
                                      bloc: profileBloc,
                                      slug: widget.slug,
                                      id: 1,
                                    ),
                                  ),
                                );
                              },
                              title: state.productCategoryModel[index].name,
                              more: index % 2,
                            ),
                            itemCount: state.productCategoryModel.length,
                            fetchMoreFunction: () {},
                            hasMoreToFetch: false,
                            physics: const NeverScrollableScrollPhysics(),
                            errorWidget: const CupertinoActivityIndicator(),
                          ),
                          // ListView.separated(
                          //   scrollDirection: Axis.vertical,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   shrinkWrap: true,
                          //   itemCount: serviceProductList.length,
                          //   itemBuilder: (context, index) =>
                          //       ServiceOrProductButton(
                          //     onTap: () {
                          //       Navigator.of(context, rootNavigator: true).push(
                          //         fade(
                          //           page: ServiceOrProductsScreen(
                          //             title: serviceProductList[index],
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //     title: serviceProductList[index],
                          //     more: index % 2,
                          //   ),
                          //   separatorBuilder: (context, index) =>
                          //       const SizedBox(height: 8),
                          // ),
                        ],
                      );
                    },
                  ),
                );
              }
              return const Center(child: CupertinoActivityIndicator());
            },
          ),
        ),
      );
}
