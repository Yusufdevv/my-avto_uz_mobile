import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_info_part.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_sliver_delegete.dart';
import 'package:auto/features/profile/presentation/pages/directory/product_screen.dart';
import 'package:auto/features/profile/presentation/pages/directory/service_or_products_screen.dart';
import 'package:auto/features/profile/presentation/widgets/directory_item.dart';
import 'package:auto/features/profile/presentation/widgets/go_all_button.dart';
import 'package:auto/features/profile/presentation/widgets/service_or_product_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DirectorySinglePage extends StatefulWidget {
  final String slug;
  final String categoriesTitle;

  const DirectorySinglePage({
    required this.slug,
    required this.categoriesTitle,
  });

  @override
  State<DirectorySinglePage> createState() => _DirectorySinglePageState();
}

class _DirectorySinglePageState extends State<DirectorySinglePage> {
  late DirectoryBloc bloc;

  @override
  void initState() {
    bloc = DirectoryBloc()
      ..add(GetDirectorySingleEvent(slug: widget.slug))
      ..add(DirectoryGetCategoriesOfSingleEvent(slug: widget.slug))
      ..add(DirectoryGetProductsOfSingleEvent(slug: widget.slug));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(
          // backgroundColor: Colors.teal,
          body: BlocBuilder<DirectoryBloc, DirectoryState>(
            builder: (context, state) {
              if (state.status.isSubmissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state.status.isSubmissionSuccess) {
                final directory = state.directory;
                return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>
                      <Widget>[
                    SliverPersistentHeader(
                        pinned: true,
                        delegate: DirectorySliverDelegate(
                          gallery: directory.gallery,
                          avatarImage: directory.avatar,
                          name: directory.name,
                          minHeight: 100,
                          category: widget.categoriesTitle,
                        )),
                  ],
                  body: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DirectoryInfoPart(
                          address: directory.address,
                          phone: directory.phone,
                          name: directory.name,
                          contactFrom: directory.contactFrom,
                          contactTo: directory.contactTo,
                          description: directory.description,
                          longitude: directory.longitude,
                          latitude: directory.latitude,
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (state.directoryProducts.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GoAllButton(
                            hasButton: true,
                            padding: EdgeInsets.zero,
                            title: LocaleKeys.featured_products.tr(),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).push(
                                fade(
                                  page: ProductsScreen(
                                    title: LocaleKeys.all_products.tr(),
                                    products: state.directoryProducts,
                                    slug: widget.slug,
                                    phoneNumber: directory.phone,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      if (state.popularProducts.isNotEmpty)
                        Container(
                          height: 120,
                          margin: const EdgeInsets.only(top: 13, bottom: 32),
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => DirectoryItem(
                              image: state.popularProducts[index].image ?? '',
                              title: state.popularProducts[index].name,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 13),
                            itemCount: state.popularProducts.length,
                          ),
                        )
                      else
                        const SizedBox(height: 24),
                      if (state.singleCategories.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GoAllButton(
                            padding: EdgeInsets.zero,
                            title: LocaleKeys.categories_services_products.tr(),
                            onPressed: () {},
                            hasButton: false,
                          ),
                        ),
                      ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.singleCategories.length,
                        itemBuilder: (context, index) => ServiceOrProductButton(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              fade(
                                page: ServiceOrProductsScreen(
                                  phoneNumber: directory.phone,
                                  id: state.singleCategories[index].id,
                                  slug: widget.slug,
                                  title: state.singleCategories[index].name,
                                ),
                              ),
                            );
                          },
                          title: state.singleCategories[index].name,
                          productCount:
                              state.singleCategories[index].productsCount,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CupertinoActivityIndicator());
            },
          ),
        ),
      );
}
